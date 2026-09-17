#!/usr/bin/env python3
"""Prototipo de CachyOS Butler: chat Qt con herramientas locales limitadas."""

from __future__ import annotations

import json
import os
import platform
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Any

import requests
from PySide6.QtCore import QObject, QThread, Signal, Slot
from PySide6.QtWidgets import (
    QApplication,
    QLabel,
    QLineEdit,
    QListWidget,
    QMainWindow,
    QMessageBox,
    QPushButton,
    QTextEdit,
    QVBoxLayout,
    QWidget,
)

OLLAMA_URL = os.getenv("BUTLER_OLLAMA_URL", "http://127.0.0.1:11434")
MODEL = os.getenv("BUTLER_MODEL", "qwen2.5:7b")

SYSTEM_PROMPT = """Eres Butler, un asistente local para CachyOS y KDE Plasma.
Responde en español de forma breve. No inventes resultados de herramientas.
No propongas comandos destructivos ni pidas ejecutar shell arbitrario.
Si el usuario necesita una acción, describe la acción segura que corresponde.
"""


class ButlerTools:
    """Herramientas explícitas; no existe una función de shell genérica."""

    @staticmethod
    def system_status() -> str:
        home = Path.home()
        total, used, free = shutil.disk_usage(home)
        return (
            f"Sistema: {platform.system()} {platform.release()}\n"
            f"Arquitectura: {platform.machine()}\n"
            f"CPU: {platform.processor() or 'no disponible'}\n"
            f"Espacio libre en {home}: {free // (1024**3)} GiB\n"
        )

    @staticmethod
    def list_home() -> str:
        entries = sorted(item.name for item in Path.home().iterdir())[:50]
        return "\n".join(entries) if entries else "El directorio personal está vacío."

    @staticmethod
    def open_application(name: str) -> str:
        allowed = {
            "firefox": "firefox",
            "dolphin": "dolphin",
            "konsole": "konsole",
            "kate": "kate",
            "systemsettings": "systemsettings",
        }
        executable = allowed.get(name.lower().strip())
        if executable is None:
            return "Aplicación no permitida. Permitidas: " + ", ".join(sorted(allowed))
        try:
            subprocess.Popen(
                [executable],
                start_new_session=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
        except OSError as error:
            return f"No se pudo abrir {executable}: {error}"
        return f"Se ha iniciado {executable}."


class OllamaWorker(QObject):
    finished = Signal(str)

    def __init__(self, messages: list[dict[str, str]]) -> None:
        super().__init__()
        self.messages = messages

    @Slot()
    def run(self) -> None:
        try:
            response = requests.post(
                f"{OLLAMA_URL}/api/chat",
                json={"model": MODEL, "messages": self.messages, "stream": False},
                timeout=90,
            )
            response.raise_for_status()
            payload: dict[str, Any] = response.json()
            answer = payload.get("message", {}).get("content")
            self.finished.emit(answer or "Ollama no devolvió contenido.")
        except (requests.RequestException, json.JSONDecodeError, TypeError) as error:
            self.finished.emit(
                "No hay respuesta de Ollama. Puedes usar las acciones locales "
                "o iniciar `ollama serve`. Detalle: " + str(error)
            )


class ButlerWindow(QMainWindow):
    def __init__(self) -> None:
        super().__init__()
        self.setWindowTitle("CachyOS Butler")
        self.resize(720, 560)
        self.messages: list[dict[str, str]] = [{"role": "system", "content": SYSTEM_PROMPT}]
        self.thread: QThread | None = None
        self.worker: OllamaWorker | None = None

        self.transcript = QTextEdit(readOnly=True)
        self.input = QLineEdit()
        self.input.setPlaceholderText("Ej.: estado del sistema, lista mi carpeta o abre Dolphin")
        self.send_button = QPushButton("Enviar")
        self.tools = QListWidget()
        self.tools.addItems(["Estado del sistema", "Listar carpeta personal"])
        self.tools.itemDoubleClicked.connect(self.use_tool)
        self.send_button.clicked.connect(self.send_message)
        self.input.returnPressed.connect(self.send_message)

        layout = QVBoxLayout()
        layout.addWidget(QLabel("CachyOS Butler — prototipo local y seguro"))
        layout.addWidget(self.transcript)
        layout.addWidget(QLabel("Acciones locales (doble clic):"))
        layout.addWidget(self.tools)
        layout.addWidget(self.input)
        layout.addWidget(self.send_button)
        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)
        self.append("Butler", "Listo. Puedo consultar el sistema, listar tu carpeta y abrir aplicaciones permitidas.")

    def append(self, author: str, text: str) -> None:
        self.transcript.append(f"<b>{author}:</b><br>{text.replace(chr(10), '<br>')}<br>")

    @Slot()
    def send_message(self) -> None:
        text = self.input.text().strip()
        if not text:
            return
        self.input.clear()
        self.append("Tú", text)
        self.messages.append({"role": "user", "content": text})
        lower = text.lower()
        if "estado del sistema" in lower or lower == "estado":
            self.append("Butler", ButlerTools.system_status())
            return
        if "lista" in lower and ("carpeta" in lower or "directorio" in lower):
            self.append("Butler", ButlerTools.list_home())
            return
        for app in ("firefox", "dolphin", "konsole", "kate", "systemsettings"):
            if f"abre {app}" in lower or f"abrir {app}" in lower:
                self.append("Butler", ButlerTools.open_application(app))
                return
        self.ask_ollama()

    def ask_ollama(self) -> None:
        self.send_button.setEnabled(False)
        self.thread = QThread(self)
        self.worker = OllamaWorker(self.messages[-12:])
        self.worker.moveToThread(self.thread)
        self.thread.started.connect(self.worker.run)
        self.worker.finished.connect(self.on_answer)
        self.worker.finished.connect(self.thread.quit)
        self.thread.finished.connect(self.on_thread_finished)
        self.thread.start()

    @Slot(str)
    def on_answer(self, answer: str) -> None:
        self.messages.append({"role": "assistant", "content": answer})
        self.append("Butler", answer)
        self.send_button.setEnabled(True)

    @Slot()
    def on_thread_finished(self) -> None:
        if self.worker is not None:
            self.worker.deleteLater()
        if self.thread is not None:
            self.thread.deleteLater()
        self.worker = None
        self.thread = None

    @Slot()
    def use_tool(self) -> None:
        item = self.tools.currentItem()
        if item is None:
            return
        if item.text() == "Estado del sistema":
            self.append("Butler", ButlerTools.system_status())
        elif item.text() == "Listar carpeta personal":
            self.append("Butler", ButlerTools.list_home())


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = ButlerWindow()
    window.show()
    sys.exit(app.exec())
