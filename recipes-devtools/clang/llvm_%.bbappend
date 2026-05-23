# llvm-native ninja -v -j 32 all OOMs the 32GB CIL worker
# (each cc1plus eats ~1.2GB; 32 parallel = ~38GB demand vs 31GB
# available). Cap parallel make to keep peak under the envelope.
PARALLEL_MAKE = "-j 4"
PARALLEL_MAKEINST = "-j 4"
