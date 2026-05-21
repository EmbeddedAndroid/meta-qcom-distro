# systemd-serialgetty is a collateral recipe with no SRC_URI of
# its own (the file lives next to the .bb in the layer). The
# archiver class (enabled by Foundries CI's bb-config.sh for
# license-compliance archives) drives do_unpack_and_patch on
# every recipe, and on systemd-serialgetty it fails with:
#
#   tar: .../archiver-work/sources/systemd-serialgetty-1.0:
#        Cannot open: No such file or directory
#
# Pointing S at the UNPACKDIR makes archiver look at the place
# files actually land, which fixes the tar. The workaround is
# carried over from meta-lmp-base; once create-spdx is generally
# moved to a different SBOM pipeline this can be revisited.
S = "${UNPACKDIR}"
