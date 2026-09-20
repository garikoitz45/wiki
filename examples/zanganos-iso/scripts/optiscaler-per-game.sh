#!/usr/bin/env bash
set -Eeuo pipefail

# Instala OptiScaler solo para el juego seleccionado.
# No se descarga ni se inyecta malware ni archivos DLL a ciegas.
if [[ $# -ne 1 ]]; then
  echo "Uso: $0 /ruta/al/directorio-del-juego" >&2
  exit 64
fi

game_dir="$1"
if [[ ! -d "$game_dir" ]]; then
  echo "No existe la carpeta del juego: $game_dir" >&2
  exit 66
fi

cat <<EOF
OptiScaler requiere revisión manual por juego.

Pasos recomendados:
1. Haz una copia de seguridad del juego.
2. Descarga la versión compatible desde la fuente oficial.
3. Comprueba licencia, anti-cheat y compatibilidad del título.
4. Instálalo solo dentro de $game_dir.
5. Prueba con la capa desactivada al principio.

No se aplica de forma global ni se descargan binarios automáticamente.
EOF
