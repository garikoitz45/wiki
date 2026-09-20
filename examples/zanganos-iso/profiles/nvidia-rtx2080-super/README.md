# ZanganOS NVIDIA RTX 2080 SUPER

Perfil de gaming para NVIDIA GeForce RTX 2080 SUPER de 8 GiB.

## Enfoque

- Driver propietario NVIDIA compatible disponible en los repositorios CachyOS/Arch.
- Vulkan NVIDIA de 64 y 32 bits.
- Steam, Wine y Protontricks.
- Gamescope y MangoHud opcionales.
- `nvidia_drm.modeset=1` debe probarse con Wayland/KDE; si el hardware o el driver presentan problemas, selecciona una sesión X11 para recuperación.
- No se aplica overclock ni undervolt automáticamente.

El paquete exacto del driver puede cambiar con la rama de CachyOS. Antes de compilar, sustituye los nombres marcados por la variante que recomiende `chwd` en el sistema de construcción.
