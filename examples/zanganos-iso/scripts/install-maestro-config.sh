#!/usr/bin/env bash
set -Eeuo pipefail

# ZanganOS no cambia archivos de CachyOS upstream: instala branding de la capa derivada.
install -Dm644 "${BASH_SOURCE[0]%/*}/maestro.toml" /etc/zanganos/maestro.toml
install -d /etc/skel/.config/autostart

cat > /etc/skel/.config/autostart/maestro.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=Maestro — ZanganOS
Comment=Mayordomo local para KDE Plasma
Exec=/usr/bin/python /opt/zanganos-maestro/main.py
OnlyShowIn=KDE;
Terminal=false
X-GNOME-Autostart-enabled=true
EOF

printf '%s\n' 'Branding ZanganOS y configuración de Maestro instalados.'
printf '%s\n' 'La aplicación Maestro debe instalarse antes de activar el autostart.'
