#!/usr/bin/env bash
# Archiso profile definition for ZanganOS NVIDIA RTX 2080 SUPER gaming build.
iso_name="zanganos-nvidia-rtx2080-super"
iso_label="ZANGANOS_NVIDIA_RTX2080SUPER_$(date +%Y%m)"
iso_publisher="ZanganOS <https://github.com/garikoitz45/wiki>"
iso_application="ZanganOS NVIDIA RTX 2080 SUPER Live/Installation ISO"
iso_version="$(date +%Y.%m.%d)"
install_dir="zanganos"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.efi' 'uefi-x64.systemd-boot.esp')
arch="x86_64"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-no-recovery')
file_permissions=(
  ["/root/customize_airootfs.sh"]="0:0:755"
)
