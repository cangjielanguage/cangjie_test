// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan World\nPASS\nPASS\n

from ffi import c.*

foreign func testfunc(a: CString, b: CString): Unit
foreign func fflushOut(): Unit

unsafe func main():Int64 {
    var a: CString = CString("Hello ")
    var b: CString = CString("World\n")
    testfunc(a, b)
    a.free()
    b.free()
    fflushOut()
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
