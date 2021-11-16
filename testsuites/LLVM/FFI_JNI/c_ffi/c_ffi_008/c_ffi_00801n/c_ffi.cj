// DEPENDENCE: pkg cfg.json cfg-main.json c_ffi.c
// EXEC: %clang %clang_opt %n.c -o lib%n.so
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg-main.json
// EXEC: %compiler %chirvic off %cmp_opt %pkg_compile pkg/pkg.cj -o pkg/
// EXEC: %compiler %chirvic off %cmp_opt %f %pkg_link -o %output 2>&1 | compare %f

import pkg.* // EXPECTED: regex package 'pkg' is not found
from ffi import c.*

unsafe func main():Int64 {
    var ptr: CPointer<Bool> = testfunc()

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
