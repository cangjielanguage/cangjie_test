// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World\nPASS\nPASS\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString
foreign func fflushOut(): Unit

func main():Int64 {
    var a: CString = CString("Hello ")
    var b: CString = CString(" World\n")
    var str: CString 
    unsafe { str = testfunc(a) }
    unsafe { printf(str) }
    unsafe { fflushOut() }
    if (str.startsWith(a)) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    if (!str.startsWith(b)) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    str.free()
    if (str.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
