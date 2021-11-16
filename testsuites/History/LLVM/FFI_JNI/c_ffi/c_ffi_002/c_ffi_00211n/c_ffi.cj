// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString

func main():Int64 {
    let a: CString = CString("Hello ")
    let b: CString = CString("World\n")
    let str: CString = testfunc(a)
    let substr1 = str.subCString(-1) // EXPECTED: regex no matching function declaration for function call 'subCString'
    printf(str)
    printf(substr1)
    str.free()
    substr1.free()
    if (substr1.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
