#!/usr/bin/env bash
# Instala componentes opcionales después de la instalación, nunca como root silencioso.
set -Eeuo pipefail

OPTIONAL_PACKAGES=(
  protonup-qt
  portproton
  stremio
  acestream-engine
)

printf '%s\n' 'ZanganOS: componentes opcionales disponibles:'
printf '  - %s\n' "${OPTIONAL_PACKAGES[@]}"
printf '%s\n' 'Verifica repositorio, firma, licencia y legalidad local antes de instalar.'

if command -v kdialog >/dev/null 2>&1; then
  kdialog --yesno '¿Quieres revisar e instalar componentes opcionales de ZanganOS?' || exit 0
fi

printf '%s\n' 'No se instala software opcional automáticamente en esta fase.'
printf '%s\n' 'Usa Maestro o el gestor de paquetes para seleccionar cada componente.'
