# Integración visual del live ISO

Copia el contenido de `branding/` al overlay de tu perfil Archiso:

```bash
sudo install -Dm644 branding/plymouth/zanganos.plymouth /etc/plymouth/themes/zanganos/zanganos.plymouth
sudo install -Dm644 branding/plymouth/zanganos.script /etc/plymouth/themes/zanganos/zanganos.script
sudo install -Dm644 branding/plymouth/logo.svg /etc/plymouth/themes/zanganos/logo.svg
sudo install -Dm644 branding/plymouth/wallpaper-zanganos.svg /etc/plymouth/themes/zanganos/wallpaper-zanganos.svg
sudo plymouth-set-default-theme -R zanganos
```

Para SDDM, instala el tema en `/usr/share/sddm/themes/zanganos/` y configura `Current=zanganos` en `/etc/sddm.conf.d/zanganos.conf`. El tema visual final de SDDM puede requerir QML adicional; estos archivos son la base de identidad y configuración.

El script `branding/scripts/zanganos-gpu-profile` detecta NVIDIA o Radeon al arrancar la sesión, sin aplicar overclock ni cambios agresivos.
