// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World\n

from ffi import c.*

foreign func testfunc(): CString
foreign func printf(fmt: CString): Int32

func main():Int64 {
    var str: CString
    unsafe { str = testfunc() }
    unsafe { printf(str) }
    return 0
}
