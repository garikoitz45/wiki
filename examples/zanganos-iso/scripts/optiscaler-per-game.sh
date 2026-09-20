#!/usr/bin/env bash
set -Eeuo pipefail

# Instala OptiScaler de forma explícita para un juego seleccionado.
# No descarga binarios a ciegas ni copia DLLs a todos los juegos.
if [[ $# -ne 1 ]]; then
  printf 'Uso: %s /ruta/al/juego\n' "$0" >&2
  exit 64
fi

game_dir="$1"
if [[ ! -d "$game_dir" ]]; then
  printf 'No existe el directorio del juego: %s\n' "$game_dir" >&2
  exit 66
fi

printf '%s\n' 'OptiScaler es una capa por juego y debe obtenerse de su fuente oficial.'
printf '%s\n' 'Copia manualmente la versión compatible en el directorio del juego:'
printf '  %s\n' "$game_dir"
printf '%s\n' 'Realiza una copia de seguridad y revisa anti-cheat/licencia antes de activarlo.'
printf '%s\n' 'No se ha instalado ningún binario automáticamente.'
