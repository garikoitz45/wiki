# ZanganOS Archiso profiles

Estas carpetas están estructuradas como perfiles de Archiso reales para compilar ISOs separadas por hardware.

## Estructura

```text
examples/zanganos-iso/
├── README.md
├── scripts/
│   └── optiscaler-per-game.sh
├── profiles/
│   ├── amd-rx580/
│   │   ├── profiledef.sh
│   │   ├── packages.x86_64
│   │   └── airootfs/
│   │       └── root/
│   │           └── customize_airootfs.sh
│   └── nvidia-rtx2080-super/
│       ├── profiledef.sh
│       ├── packages.x86_64
│       └── airootfs/
│           └── root/
│               └── customize_airootfs.sh
```

## Compilación con Archiso

Asegúrate de tener un entorno archiso/cachyos funcionando y el repositorio del perfil de cachyos disponible.

```bash
sudo mkarchiso -v -w work-amd -o out-amd ./examples/zanganos-iso/profiles/amd-rx580
sudo mkarchiso -v -w work-nvidia -o out-nvidia ./examples/zanganos-iso/profiles/nvidia-rtx2080-super
mv out-amd/*.iso out-amd/zanganos-amd-rx580.iso
mv out-nvidia/*.iso out-nvidia/zanganos-nvidia-rtx2080-super.iso
```

## Recomendaciones reales

- Las ISOs se compilan con perfiles separados por GPU.
- OptiScaler se configura por juego y no se instala de forma global.
- AMD RX 580 usa Mesa/RADV; NVIDIA RTX 2080 SUPER usa driver propietario.
- Revisa los nombres de paquetes con los repositorios activos antes de cada build.
- El perfil debe validarse con `mkarchiso` y probarse en el hardware objetivo.

## Seguridad

- No instales claves secretas o tokens de servicios externos en la ISO.
- No habilites SSH ni `NOPASSWD` ni sudo sin contraseña.
- No fuerces overclocking ni undervolting desde el live environment.
- Mantén el contenido opcional para que sea decisión del usuario final.
