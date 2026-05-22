# llvm-native's stdlib + clang/lld/etc compile launches a wide
# parallel build that, like go-runtime, spikes memory beyond what
# the Foundries CI partner-AWS worker can sustain. Build 22 saw
# `ninja -v -j 16 all` exit with code 1 after 22 steps, no
# compiler error in the log - classic OOM-kill signature.
#
# Cap llvm's per-recipe parallelism. Slightly longer wall-clock
# for this one recipe in exchange for the build actually finishing.
#
# Tracked with Foundries support as a worker-resourcing issue
# (FOUNDRIES_PARTNER_AWS_WORKER_OOM_ASK.md in this project);
# revert once the worker has headroom.
PARALLEL_MAKE = "-j 2"
PARALLEL_MAKEINST = "-j 2"
