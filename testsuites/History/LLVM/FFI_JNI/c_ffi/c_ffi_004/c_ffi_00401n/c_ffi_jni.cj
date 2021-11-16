// DEPENDENCE: %n.cpp cfg.json base.json pkg.cj
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" base.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt pkg.cj -i base.json -o pkg.panda
// EXEC-PIPE-1: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f

import test.*
from ffi import c.*

unsafe func main():Int64 {
    var ptr: CPointer<Bool> = testfunc() // EXPECTED: regex undeclared identifier 'testfunc'

    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    if (!ptr.read(0) || ptr.read(1)) {
        return 3
    }

    print("CPointer Type Bool\n")
    return 0
}
