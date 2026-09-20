#!/usr/bin/env bash
set -Eeuo pipefail

# NVIDIA RTX 2080 SUPER: driver propietario y Vulkan.
# El nombre del paquete del módulo del kernel depende del kernel elegido.
install -d /etc/zanganos/gaming
cat > /etc/zanganos/gaming/profile.conf <<'EOF'
ZANGANOS_GPU_PROFILE=nvidia-rtx2080-super
ZANGANOS_VULKAN_DRIVER=nvidia
ZANGANOS_OPTISCALER_MODE=per-game
ZANGANOS_NVIDIA_DRM_MODESET=1
ZANGANOS_GAMESCOPE_DEFAULT=0
ZANGANOS_MANGOHUD_DEFAULT=0
EOF

printf '%s\n' 'Perfil ZanganOS NVIDIA RTX 2080 SUPER instalado.'
printf '%s\n' 'Comprueba el módulo NVIDIA adecuado para linux-cachyos antes de compilar.'
printf '%s\n' 'OptiScaler queda configurado por juego, no globalmente.'
