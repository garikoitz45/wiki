# ZanganOS Archiso final build

Este directorio contiene la versión final base para compilar dos ISOs separadas de ZanganOS con Archiso/CachyOS.

## Perfiles incluidos

- `profiles/amd-rx580/` — para AMD Radeon RX 580 con Mesa/RADV
- `profiles/nvidia-rtx2080-super/` — para NVIDIA GeForce RTX 2080 SUPER 8 GiB con driver propietario

## Requisitos

Necesitas un entorno CachyOS/Archiso con `mkarchiso` disponible:

```bash
sudo pacman -S archiso mkinitcpio mkinitcpio-archiso
```

O en un entorno CachyOS similar al de la rama de compilación del proyecto.

## Compilación

```bash
sudo mkarchiso -v -w work-amd -o out-amd ./profiles/amd-rx580
sudo mkarchiso -v -w work-nvidia -o out-nvidia ./profiles/nvidia-rtx2080-super

mv out-amd/*.iso out-amd/zanganos-amd-rx580.iso
mv out-nvidia/*.iso out-nvidia/zanganos-nvidia-rtx2080-super.iso
```

## Política de seguridad

- No instalar tokens, claves ni credenciales en la ISO.
- No añadir `sudo` sin contraseña ni `NOPASSWD`.
- No activar overclocking ni undervolting automáticamente.
- OptiScaler se deja como capa por juego, nunca global.
- El usuario debe dar consentimiento antes de instalar modelos, software extra o componentes opcionales.

## En el hardware objetivo

### AMD RX 580

```bash
vulkaninfo --summary
mangohud glxinfo -B
```

### NVIDIA RTX 2080 SUPER

```bash
nvidia-smi
vulkaninfo --summary
```

## Importante

Este es un perfil de compilación realista; la ISO final requiere validación real del entorno CachyOS/Archiso y comprobación del hardware en el que se instalará.
