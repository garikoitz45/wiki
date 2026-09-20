# ZanganOS AMD RX 580

Perfil de gaming para Radeon RX 580. Usa Mesa y RADV, sin instalar drivers NVIDIA.

## Enfoque

- `linux-cachyos` como kernel base.
- Mesa/RADV para Vulkan.
- `vulkan-radeon` y `lib32-vulkan-radeon` para juegos de 64 y 32 bits.
- Steam, Wine y Protontricks.
- Gamescope y MangoHud opcionales para escalado, composición y métricas.
- Configuración de energía conservadora; no se aplica overclock automáticamente.

La RX 580 tiene 8 GiB en muchas variantes, pero se recomienda verificar la VRAM real y el fabricante antes de activar perfiles específicos.
