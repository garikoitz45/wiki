#!/usr/bin/env bash
set -Eeuo pipefail

# ZanganOS NVIDIA RTX 2080 SUPER profile customization.
# Keep the driver setup explicit and review the module for your selected kernel.
install -d /etc/zanganos/gaming
cat > /etc/zanganos/gaming/profile.conf <<'EOF'
ZANGANOS_GPU_PROFILE=nvidia-rtx2080-super
ZANGANOS_VULKAN_DRIVER=nvidia
ZANGANOS_OPTISCALER_MODE=per-game
ZANGANOS_NVIDIA_DRM_MODESET=1
ZANGANOS_GAMESCOPE_DEFAULT=0
ZANGANOS_MANGOHUD_DEFAULT=0
EOF

cat > /etc/issue <<'EOF'
ZanganOS NVIDIA RTX 2080 SUPER

Kernel: $(uname -r)
Distro: CachyOS-based gaming profile
EOF

printf '%s\n' 'Perfil ZanganOS NVIDIA RTX 2080 SUPER configurado.'
printf '%s\n' 'Revisa el módulo NVIDIA exacto para tu kernel antes del build final.'
printf '%s\n' 'OptiScaler se usa por juego y no como capa global del sistema.'
