# ZanganOS Gaming ISO profiles

Este directorio define dos perfiles de hardware para generar imágenes separadas:

- `amd-rx580/`: AMD Radeon RX 580 con Mesa/RADV.
- `nvidia-rtx2080-super/`: NVIDIA RTX 2080 SUPER 8 GiB con driver propietario y Vulkan.

OptiScaler no se fuerza globalmente en el sistema: es una capa/mod por juego y requiere archivos, versión y configuración compatibles con cada título. Los scripts dejan una configuración base segura y un instalador explícito; el usuario debe seleccionar el juego y revisar su compatibilidad.

## Construcción

Necesitas un perfil archiso/releng válido y los paquetes disponibles en tus repositorios. Copia el contenido del perfil correspondiente dentro de tu perfil de compilación y ejecuta:

```bash
sudo mkarchiso -v -w work-amd -o out-amd profiles/amd-rx580
sudo mkarchiso -v -w work-nvidia -o out-nvidia profiles/nvidia-rtx2080-super
mv out-amd/*.iso out-amd/zanganos-amd-rx580.iso
mv out-nvidia/*.iso out-nvidia/zanganos-nvidia-rtx2080-super.iso
```

No se debe compilar una ISO NVIDIA en hardware AMD ni asumir que el driver propietario funciona en una GPU distinta. Prueba cada ISO en una máquina virtual con GPU passthrough o en el hardware objetivo.

## OptiScaler

OptiScaler debe instalarse por juego en el directorio de instalación de Steam/Proton. No se incluye una DLL descargada automáticamente ni una configuración universal, porque la versión adecuada depende del juego, API gráfica, anti-cheat y licencia. Usa una copia de seguridad y conserva una forma de desactivar la capa.

Ejemplo conceptual de variables por juego:

```bash
# Solo como referencia; no es una configuración universal.
PROTON_ENABLE_NVAPI=1 %command%
```

Consulta la documentación y los lanzamientos oficiales de OptiScaler antes de copiar sus archivos.
