require conf/distro/sota.conf.inc

INITRAMFS_IMAGE = "initramfs-ostree-image"

DISTRO_NAME:append = " (OTA-enabled)"

# ptest is not generally useful with ostree-based images (ro /usr)
DISTRO_FEATURES_OPTED_OUT += "ptest"

# Generate an OSTree repository tarball during image build
BUILD_OSTREE_REPO_TARBALL = "1"

# Default SOTA client for qcom-distro-sota factories. Foundries CI
# overrides this in bb-config.sh; setting a sensible default here
# means local kas builds and other consumers do not have to.
# Absorbed from meta-lmp/conf/distro/include/lmp.inc as part of
# the meta-lmp retirement.
SOTA_CLIENT ??= "aktualizr-lite"
