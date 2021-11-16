// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: -1280127

from ffi import c.*

foreign func testfunc(): CPointer<Int8>

unsafe func main():Int64 {
    var ptr: CPointer<Int8> = testfunc()
    var ptrtmp: CPointer<Int8> = ptr + 1

    print("before: ")
    print((ptrtmp - 1).read().toString())
    print(ptrtmp.read().toString())
    print((ptrtmp + 1).read().toString())

    return 0
}
