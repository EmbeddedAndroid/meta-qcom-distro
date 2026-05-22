# go-runtime's stdlib compile launches a wide parallel build that
# spikes memory usage well above what the rest of the bitbake graph
# uses. Foundries CI builds 20 and 21 both saw the bitbake cooker
# server go silent (No reply from server in 30s) within minutes of
# go-runtime do_compile starting on the partner amd64-aws worker;
# the most likely cause is OOM-killer taking out bitbake-server (or
# its worker subprocess) under the combined go-runtime + parallel
# task load.
#
# Cap go-runtime's per-recipe parallelism so its compile phase
# stops being the worker tipping point. Slight build slowdown for
# this one recipe in exchange for the cooker actually surviving.
#
# Tracked with Foundries support as a worker-resourcing issue;
# revert once the worker has headroom (or once go upstream
# improves its stdlib-build memory footprint).
PARALLEL_MAKE = "-j 2"
PARALLEL_MAKEINST = "-j 2"
