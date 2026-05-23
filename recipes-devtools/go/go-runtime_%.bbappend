# Same OOM-mitigation pattern as llvm; go-runtime's stdlib build
# launches many parallel cc1 invocations and can also exhaust the
# 32GB envelope on the CIL worker.
PARALLEL_MAKE = "-j 4"
PARALLEL_MAKEINST = "-j 4"
