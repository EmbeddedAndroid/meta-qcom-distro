FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Disable PTEST for ostree as it requires options that are not enabled when
# building with meta-updater.
PTEST_ENABLED = "0"

# u-boot helper + grub.cfg cosmetic. Both qcom-irrelevant in practice
# (qcom boards boot via EFI / systemd-boot, not u-boot) but kept here
# for non-EFI consumers using qcom-distro until they can be sunset.
SRC_URI:append = " \
    file://0003-u-boot-add-bootdir-to-the-generated-uEnv.txt.patch \
    file://0004-ostree-decrease-default-grub.cfg-timeout-and-set-def.patch \
"

PACKAGECONFIG:remove = "static"
