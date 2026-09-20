# Branding visual de ZanganOS

Esta carpeta contiene previsualizaciones SVG del diseño visual propuesto:

- `wallpaper-zanganos.svg`: fondo de escritorio con logo neón púrpura.
- `login-zanganos.svg`: pantalla de inicio de sesión/splash.
- `loading-zanganos.svg`: pantalla de carga con barra de progreso.
- `desktop-preview.svg`: mockup del escritorio KDE Plasma con el panel Maestro.

## Vista rápida

Puedes abrir los SVG directamente en un navegador:

```bash
xdg-open examples/zanganos-branding/desktop-preview.svg
xdg-open examples/zanganos-branding/login-zanganos.svg
xdg-open examples/zanganos-branding/loading-zanganos.svg
xdg-open examples/zanganos-branding/wallpaper-zanganos.svg
```

## Integración posterior en la ISO

- Instalar el wallpaper en `/usr/share/wallpapers/ZanganOS/`.
- Configurar Plasma mediante un perfil de usuario (`plasma-org.kde.plasma.desktop-appletsrc`).
- Usar Plymouth para la animación de arranque; una imagen SVG aislada es una previsualización, no un tema Plymouth completo.
- Usar SDDM para la pantalla de login; el tema SDDM requiere su propio `theme.conf` y recursos.
- Mantener una resolución vectorial y generar PNG optimizados para hardware que no soporte SVG.

Los archivos adjuntos originales no están almacenados como blobs en el repositorio, así que estas previsualizaciones recrean la identidad neón púrpura de ZanganOS. Cuando los archivos estén disponibles dentro del repositorio, pueden sustituirse sin cambiar la estructura.
