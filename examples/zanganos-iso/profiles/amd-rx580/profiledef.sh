#!/usr/bin/env bash
set -Eeuo pipefail

# Archiso profile definition for ZanganOS AMD RX 580 gaming ISO.
iso_name="zanganos-amd-rx580"
iso_label="ZANGANOS_AMD_RX580_$(date +%Y%m)"
iso_publisher="ZanganOS <https://github.com/garikoitz45/wiki>"
iso_application="ZanganOS AMD RX 580 Live/Installation ISO"
iso_version="$(date +%Y.%m.%d)"
install_dir="zanganos"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.efi' 'uefi-x64.systemd-boot.esp')
arch="x86_64"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-no-recovery')
file_permissions=(
  ["/root/customize_airootfs.sh"]="0:0:755"
)
