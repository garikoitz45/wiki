# Prototipo CachyOS Butler

Prototipo local del asistente IA para KDE Plasma desarrollado con Python y PySide6.

## Características

- Interfaz de chat Qt.
- Conexión opcional con Ollama en `http://127.0.0.1:11434`.
- Modo demostración si Ollama no está disponible.
- Herramientas limitadas y explícitas:
  - consultar el estado básico del sistema;
  - listar el directorio personal;
  - abrir aplicaciones de una lista permitida.
- No ejecuta comandos de shell arbitrarios.

## Requisitos

```bash
sudo pacman -S python-pyside6
# Opcional para respuestas locales de IA:
sudo pacman -S ollama
ollama serve
ollama pull qwen2.5:7b
```

También se puede usar un entorno virtual para instalar `requests`:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Ejecución

```bash
python main.py
```

Variables de entorno opcionales:

```bash
export BUTLER_MODEL=qwen2.5:7b
export BUTLER_OLLAMA_URL=http://127.0.0.1:11434
```

## Seguridad

Este prototipo no concede privilegios de root y no interpreta texto como shell. Antes de añadir nuevas herramientas, deben definirse como funciones independientes, validar sus argumentos y clasificarse por nivel de riesgo.
