# dbus-glib's examples subdir invokes the just-built dbus-binding
# -tool against example .xml files. dbus-binding-tool uses glib's
# g_spawn(), which on the Foundries CI worker (lmp-sdk:next
# container, restricted seccomp) hits:
#
#   Compilation failed: Failed to close file descriptor for child
#   process (Operation not permitted)
#
# The examples are not packaged or installed; skipping them costs
# nothing. Patch the top-level Makefile to remove the examples
# target from SUBDIRS before do_compile runs.
do_configure:append() {
    for mf in ${B}/dbus/Makefile ${S}/dbus/Makefile.am ${S}/dbus/Makefile.in; do
        if [ -f "$mf" ]; then
            sed -i -E 's/(^SUBDIRS[ \t]*=[^\n]*) examples([^\n]*)/\1\2/' "$mf"
        fi
    done
}

# Pre-create the missing example-service-glue.h header so that any
# stray make rule referring to it succeeds as a no-op.
do_compile:prepend() {
    mkdir -p ${B}/dbus/examples
    : > ${B}/dbus/examples/example-service-glue.h
    : > ${B}/dbus/examples/example-client-glue.h
}
