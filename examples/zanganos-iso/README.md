# ZanganOS ISO

Perfil de referencia para una ISO derivada de CachyOS con KDE Plasma, gaming, multimedia opcional y Maestro.

## Principios

- No se sobrescriben marcas upstream dentro de paquetes de CachyOS.
- No se descargan modelos ni software de terceros durante el build.
- Los componentes opcionales se muestran al usuario y requieren confirmación.
- `pip` se usa preferentemente dentro de entornos virtuales.
- AceStream, Stremio, PortProton y ProtonUp-Qt pueden depender de repositorios externos; comprueba disponibilidad, firma, licencia y legalidad antes de incluirlos.

## Uso

Copia `packages.x86_64` y los scripts al perfil archiso/releng de tu entorno de compilación. Revisa los nombres de paquetes contra los repositorios activos antes de ejecutar `mkarchiso`, ya que los nombres y la disponibilidad pueden cambiar.

```bash
chmod +x scripts/*.sh
sudo mkarchiso -v -w work -o out .
mv out/*.iso out/zanganos.iso
```

## Maestro y agentes

`maestro.toml` declara los proveedores y agentes. La configuración inicial usa Ollama local, con llama.cpp como proveedor alternativo. No existe un catálogo universal de “todos los agentes gratuitos”: cada modelo y framework tiene licencia, requisitos y disponibilidad propios. Maestro coordina únicamente los proveedores instalados y habilitados por el usuario.

## Seguridad

No se debe incluir una contraseña conocida, `NOPASSWD: ALL`, SSH abierto ni ejecución arbitraria en una ISO distribuible. El usuario debe crearse durante la instalación con credenciales propias y las acciones administrativas deben pasar por polkit/sudo y confirmación visible.
