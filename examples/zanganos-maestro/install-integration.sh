#!/usr/bin/env bash
set -Eeuo pipefail

# Instala la integración del lanzador, no el repositorio de AI Maestro.
# La clonación y revisión del repositorio se realizan de forma explícita por el usuario.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
install -Dm755 "$ROOT/maestro-launcher.sh" "$HOME/.local/bin/zanganos-maestro"
install -Dm644 "$ROOT/zanganos-maestro.desktop" "$HOME/.local/share/applications/zanganos-maestro.desktop"

printf '%s\n' 'Integración de Maestro instalada.'
printf '%s\n' 'Instala AI Maestro en ~/.local/opt/ai-maestro y usa el lanzador de KDE.'
