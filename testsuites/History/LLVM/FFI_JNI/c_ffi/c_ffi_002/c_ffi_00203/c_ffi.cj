// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan HelloCangjie\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(a: CString, b: CString): CString

unsafe func main():Int64 {
    var a: CString = CString("Hello")
    var b: CString = CString("Cangjie\n")
    var str: CString = testfunc(a, b)
    printf(str)
    str.free()
    return 0
}
