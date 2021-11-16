// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args

from ffi import c.*

foreign func testfunc(): CPointer<Bool>

unsafe func main():Int64 {
    var ptr: CPointer<Bool> = testfunc()
    if (!ptr.isNotNull()) { return 1 }

    if (ptr.isNull()) { return 2 }

    if (!ptr.read(0) || ptr.read(1)) { return 3 }

    print("CPointer Type Bool\n")
    return 0
}
