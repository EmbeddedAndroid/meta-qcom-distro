FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Patch glib's close_range() callers to fall back to safe_fdwalk on
# EPERM, not just ENOSYS/EINVAL. Foundries CI's lmp-sdk:next container
# has a seccomp profile that denies close_range with EPERM; every
# native build of a glib-spawn consumer (glib-compile-resources,
# dbus-binding-tool, gdbus-codegen, g-ir-scanner) fails with:
#
#   Failed to close file descriptor for child process
#   (Operation not permitted)
#
# Until the container profile is relaxed (see
# FOUNDRIES_LMP_SDK_NEXT_SECCOMP_ASK.md), patch glib to retry via the
# per-fd close loop on EPERM. Local builds outside the restricted
# container are unaffected because close_range succeeds there.
SRC_URI:append = " file://0001-glib-fall-back-on-EPERM-from-close_range.patch"
