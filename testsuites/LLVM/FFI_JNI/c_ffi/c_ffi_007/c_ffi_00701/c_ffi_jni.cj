// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan CPointer Type Unit\n
// ASSERT: scan-not Exception

from ffi import c.*

foreign func testfunc(): CPointer<Unit>

unsafe func main():Int64 {
    var ptr: CPointer<Unit> = testfunc()

    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    if (ptr.read() != ()) {
        return 3
    }
    print("CPointer Type Unit\n")
    return 0
}
