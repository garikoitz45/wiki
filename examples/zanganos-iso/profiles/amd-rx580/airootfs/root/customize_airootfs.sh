#!/usr/bin/env bash
set -Eeuo pipefail

# ZanganOS AMD RX 580 profile customization.
# Keep this minimal and explicit. Only adjust the system for the target GPU.
install -d /etc/zanganos/gaming
cat > /etc/zanganos/gaming/profile.conf <<'EOF'
ZANGANOS_GPU_PROFILE=amd-rx580
ZANGANOS_VULKAN_DRIVER=radv
ZANGANOS_OPTISCALER_MODE=per-game
ZANGANOS_GAMESCOPE_DEFAULT=0
ZANGANOS_MANGOHUD_DEFAULT=0
EOF

# Optional: local branding hook to help identify the live ISO.
cat > /etc/issue <<'EOF'
ZanganOS AMD RX 580

Kernel: $(uname -r)
Distro: CachyOS-based gaming profile
EOF

printf '%s\n' 'Perfil ZanganOS AMD RX 580 configurado.'
printf '%s\n' 'OptiScaler se usa por juego y no como capa global del sistema.'
