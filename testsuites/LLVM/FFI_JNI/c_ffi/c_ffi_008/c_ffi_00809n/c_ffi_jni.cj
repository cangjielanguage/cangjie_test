// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

foreign func testfunc(): CPointer<Bool>

func main():Int64 {
    var ptr: CPointer<Bool> = testfunc()   // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    unsafe { if (!ptr.isNotNull()) { return 1 } }

    unsafe { if (ptr.isNull()) { return 2 } }

    unsafe { if (!ptr.read(0) || ptr.read(1)) { return 3 } }

    print("CPointer Type Bool\n")
    return 0
}
