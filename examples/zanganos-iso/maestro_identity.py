#!/usr/bin/env python3
"""Identidad visual y nombre de ventana para el prototipo Maestro de ZanganOS."""

from pathlib import Path

APP_NAME = "Maestro — ZanganOS"
CONFIG_PATH = Path("/etc/zanganos/maestro.toml")
AUDIT_DIR = Path.home() / ".local" / "state" / "zanganos-maestro"


def application_name() -> str:
    return APP_NAME


def ensure_audit_directory() -> Path:
    AUDIT_DIR.mkdir(parents=True, exist_ok=True)
    return AUDIT_DIR


if __name__ == "__main__":
    print(APP_NAME)
