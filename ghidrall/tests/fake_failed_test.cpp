// RUN: %sea bpf -m64 -O0 --bmc=mono --bound=8  --horn-stats --inline  "%s" 2>&1 | OutputCheck %s
// RUN: %sea bpf -m64 -O1 --bmc=mono --bound=8  --horn-stats --inline  "%s" 2>&1 | OutputCheck %s
// RUN: %sea bpf -m64 -O2 --bmc=mono --bound=8  --horn-stats --inline  "%s" 2>&1 | OutputCheck %s
// RUN: %sea bpf -m64 -O3 --bmc=mono --bound=8  --horn-stats --inline  "%s" 2>&1 | OutputCheck %s
// XFAIL: *

// CHECK-L: unsat


#include "test.hpp"

int main() {
  path_start();
  path_goal();
}
