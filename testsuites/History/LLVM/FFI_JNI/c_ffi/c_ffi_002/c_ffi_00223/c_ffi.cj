// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abcde\nPASS\n

from ffi import c.*

foreign func testfunc(a: CString, b: CString, c: CString, d: CString, e: CString): Int32
foreign func fflushOut(): Unit

unsafe func main():Int64 {
    let a: CString = CString("a")
    let b: CString = CString("b")
    let c: CString = CString("c")
    let d: CString = CString("d")
    let e: CString = CString("e\n")
    if (testfunc(a, b, c, d, e) == 6) {
        fflushOut()
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
