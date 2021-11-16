// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan cangjie

from ffi import c.*

foreign func printf(fmt: CString, ...): Int32
foreign func testfunc(): CPointer<CString>

unsafe func main():Int64 {
    var ptr: CPointer<CString> = testfunc() 

    printf(ptr.read(0))
    printf(ptr.read(1))

    return 0
}
