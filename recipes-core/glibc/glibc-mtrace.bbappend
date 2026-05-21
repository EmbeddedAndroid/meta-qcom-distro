# glibc-mtrace is a "collateral" recipe: it ships a single perl
# script (mtrace) copied out of glibc's own sysroot at install
# time, with no SRC_URI of its own. oe-core's archiver.bbclass
# (enabled by foundriesio/ci-scripts bb-config.sh for the
# Foundries CI compliance archive) drives do_unpack_and_patch on
# every recipe; on glibc-mtrace it hits a tar failure because
# there is nothing to unpack. Skip the archiver tasks for this
# recipe.
do_unpack_and_patch[noexec] = "1"
do_ar_original[noexec] = "1"
do_ar_patched[noexec] = "1"
do_ar_configured[noexec] = "1"
do_deploy_archives[noexec] = "1"
