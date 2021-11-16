// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan not null\n

from ffi import c.*

foreign func testfunc(): CPointer<Int16>

unsafe func main():Int64 {
    var ptr: CPointer<Int16> = testfunc()
    if (ptr.isNull()) {
        print("null\n")
        return 1
    }
    print("not null\n")
    return 0
}
