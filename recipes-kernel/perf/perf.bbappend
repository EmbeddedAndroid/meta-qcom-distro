# perf builds the Linux performance tool from the kernel source
# tree (its real source lives in linux-yocto's tools/perf, not in
# the recipe's UNPACKDIR). archiver's do_unpack_and_patch can't
# find anything to tar in the recipe-local sources path and
# fails. Same archiver-vs-collateral-recipe pattern we already
# disable for glibc-mtrace and work around for systemd-serialgetty.
#
# Mark the archiver tasks noexec for this recipe; perf is built
# from the kernel sources which the kernel recipe already archives
# correctly, so we lose nothing.
do_unpack_and_patch[noexec] = "1"
do_ar_original[noexec] = "1"
do_ar_patched[noexec] = "1"
do_ar_configured[noexec] = "1"
do_deploy_archives[noexec] = "1"
