// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan World\nPASS\nPASS\n

from ffi import c.*

foreign func testfunc(a: CString, b: CString): Unit
foreign func fflushOut(): Unit

func main():Int64 {
    var a: CString = CString("Hello ")
    var b: CString = CString("World\n")
    unsafe { testfunc(a, b) }
    a.free()
    b.free()
    unsafe { fflushOut() }
    if (a.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    if (b.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
