#!/usr/bin/env bash
set -Eeuo pipefail

# Personalización final del perfil AMD RX 580.
# Mantén esto mínimo, específico y seguro.
install -d /etc/zanganos/gaming
cat > /etc/zanganos/gaming/profile.conf <<'EOF'
ZANGANOS_GPU_PROFILE=amd-rx580
ZANGANOS_VULKAN_DRIVER=radv
ZANGANOS_OPTISCALER_MODE=per-game
ZANGANOS_GAMESCOPE_DEFAULT=0
ZANGANOS_MANGOHUD_DEFAULT=0
ZANGANOS_DESKTOP_THEME=zanganos-neon-purple
EOF

# Versionado mínimo para la ISO y el usuario.
cat > /etc/issue <<'EOF'
ZanganOS AMD RX 580

Kernel: $(uname -r)
Distro: CachyOS-based gaming profile
Plasma: KDE + Maestro
EOF

# Crear el directorio del usuario por defecto y dejar marca del perfil.
mkdir -p /etc/skel/.config/zanganos
cat > /etc/skel/.config/zanganos/gpu-profile <<'EOF'
amd-rx580
EOF

printf '%s\n' 'Perfil ZanganOS AMD RX 580 configurado.'
printf '%s\n' 'OptiScaler se usa por juego y no como capa global.'
