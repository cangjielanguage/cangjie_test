// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World2

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(a: CString, b: CString, c: CString, num1: Int32, num2: Int32): CString

func main():Int64 {
    var a: CString = CString("Hello World1")
    var b: CString = CString("Hello World2")
    var c: CString = CString("Hello World3")
    var str: CString
    unsafe { str = testfunc(a, b, c, 100, 10) }
    unsafe { printf(str) }
    a.free()
    b.free()
    c.free()
    return 0
}
