#!/usr/bin/env bash
set -Eeuo pipefail

# AMD RX 580: Mesa/RADV y herramientas de gaming.
# No modifica frecuencias ni aplica overclock.
install -d /etc/zanganos/gaming
cat > /etc/zanganos/gaming/profile.conf <<'EOF'
ZANGANOS_GPU_PROFILE=amd-rx580
ZANGANOS_VULKAN_DRIVER=radv
ZANGANOS_OPTISCALER_MODE=per-game
ZANGANOS_GAMESCOPE_DEFAULT=0
ZANGANOS_MANGOHUD_DEFAULT=0
EOF

printf '%s\n' 'Perfil ZanganOS AMD RX 580 instalado.'
printf '%s\n' 'OptiScaler queda configurado por juego, no globalmente.'
