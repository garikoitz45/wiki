#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="${AIMAESTRO_DIR:-$HOME/.local/opt/ai-maestro}"
PORT="${AIMAESTRO_PORT:-23000}"
URL="http://127.0.0.1:${PORT}"

if [[ ! -f "$ROOT/package.json" ]]; then
  printf '%s\n' "AI Maestro no está instalado en $ROOT. Consulta la documentación de ZanganOS." >&2
  exit 1
fi

if ! command -v yarn >/dev/null 2>&1; then
  printf '%s\n' 'Falta yarn. Instala Node.js y habilita Corepack.' >&2
  exit 1
fi

cd "$ROOT"
if [[ ! -d node_modules ]]; then
  yarn install
fi

if ! curl --silent --fail --max-time 1 "$URL" >/dev/null 2>&1; then
  nohup env PORT="$PORT" HOSTNAME=127.0.0.1 yarn dev >"${XDG_STATE_HOME:-$HOME/.local/state}/zanganos-maestro.log" 2>&1 &
  for _ in {1..30}; do
    curl --silent --fail --max-time 1 "$URL" >/dev/null 2>&1 && break
    sleep 1
  done
fi

if command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$URL" >/dev/null 2>&1 &
else
  printf '%s\n' "AI Maestro disponible en $URL"
fi
