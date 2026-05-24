FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Disable PTEST for ostree as it requires options that are not enabled
# when building with meta-updater.
PTEST_ENABLED = "0"

PACKAGECONFIG:remove = "static"
