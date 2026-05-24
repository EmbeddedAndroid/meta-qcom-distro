# docker-compose is Go-built; its compile spawns many parallel cc1
# invocations and OOM-killed the bitbake Cooker on the 32GB CIL
# worker (cc1plus + Cooker both reaped while docker-compose
# do_compile was running). Cap parallelism like llvm + go-runtime.
PARALLEL_MAKE = "-j 4"
PARALLEL_MAKEINST = "-j 4"
