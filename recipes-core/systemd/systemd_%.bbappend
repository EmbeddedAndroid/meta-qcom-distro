# When the systemd PACKAGECONFIG enables 'efi', oe-core's
# systemd recipe ships /usr/lib/systemd/boot/efi/systemd-bootaa64.efi
# in the main systemd package. systemd-boot (a separate recipe used
# by qcom-distro-sota and meta-qcom-distro's systemd-boot bbappend
# to install the EFI payload at the same path) then collides with
# systemd on that file during do_rootfs.
#
# Strip the systemd-boot payload from the systemd package's deploy
# dir so it is owned exclusively by the systemd-boot recipe.
do_install:append:qcom-distro() {
    if ${@bb.utils.contains('PACKAGECONFIG', 'efi', 'true', 'false', d)}; then
        rm -rf ${D}${nonarch_libdir}/systemd/boot
    fi
}

# When EFI_PROVIDER is systemd-boot (the qcom-distro-sota default),
# the systemd package needs systemd-boot as a runtime dep so it
# lands in the rootfs alongside systemd.
RDEPENDS:${PN}:append:qcom-distro = "${@bb.utils.contains('EFI_PROVIDER', 'systemd-boot', ' systemd-boot', '', d)}"
