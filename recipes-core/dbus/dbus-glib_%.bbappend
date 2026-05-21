# dbus-glib_0.114's autotools build has long-standing parallel-make
# races in its docs/introspection generation. Foundries CI build 17
# failed dbus-glib-native:do_compile with bare "oe_runmake failed"
# (no useful diagnostic in the summary), and oe-core wrynose ships
# the same recipe that has historically misbehaved under high
# parallelism inside the lmp-sdk container.
#
# Force serial make for this recipe (target + native) until a
# proper upstream fix lands. Cheap recipe, the slowdown is tiny.
PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""
