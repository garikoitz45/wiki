#!/usr/bin/env bash
set -Eeuo pipefail

# Personalización final del perfil NVIDIA RTX 2080 SUPER 8GB.
# Comprueba el módulo NVIDIA exacto de tu kernel antes del build final.
install -d /etc/zanganos/gaming
cat > /etc/zanganos/gaming/profile.conf <<'EOF'
ZANGANOS_GPU_PROFILE=nvidia-rtx2080-super
ZANGANOS_VULKAN_DRIVER=nvidia
ZANGANOS_OPTISCALER_MODE=per-game
ZANGANOS_NVIDIA_DRM_MODESET=1
ZANGANOS_GAMESCOPE_DEFAULT=0
ZANGANOS_MANGOHUD_DEFAULT=0
ZANGANOS_DESKTOP_THEME=zanganos-neon-purple
EOF

cat > /etc/issue <<'EOF'
ZanganOS NVIDIA RTX 2080 SUPER 8GB

Kernel: $(uname -r)
Distro: CachyOS-based gaming profile
Plasma: KDE + Maestro
EOF

mkdir -p /etc/skel/.config/zanganos
cat > /etc/skel/.config/zanganos/gpu-profile <<'EOF'
nvidia-rtx2080-super
EOF

printf '%s\n' 'Perfil ZanganOS NVIDIA RTX 2080 SUPER configurado.'
printf '%s\n' 'Revisa el módulo NVIDIA exacto para el kernel antes del build final.'
printf '%s\n' 'OptiScaler se usa por juego y no como capa global del sistema.'
