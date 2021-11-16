// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World\nPASS\nPASS\nPASS\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString
foreign func fflushOut(): Unit

unsafe func main():Int64 {
    var a: CString = CString("Hello ")
    var b: CString = CString("World\n")
    var str: CString = testfunc(a)
    printf(str)
    fflushOut()
    if (str.endsWith(a)) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    if (str.endsWith(b)) {
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
