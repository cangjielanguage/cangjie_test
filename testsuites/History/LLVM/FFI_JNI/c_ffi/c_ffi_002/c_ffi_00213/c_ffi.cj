// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World\nHello World\nWorldPASS\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString
foreign func fflushOut(): Unit

unsafe func main():Int64 {
    var a: CString = CString("Hello ")
    var b: CString = CString("World\n")
    var str: CString = testfunc(a)
    var substr1 = str.subCString(0, 12)
    var substr2 = str.subCString(6, 5)
    printf(str)
    printf(substr1)
    printf(substr2)
    fflushOut()
    str.free()
    substr1.free()
    substr2.free()
    if (substr1.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
