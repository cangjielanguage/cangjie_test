// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString

func main():Int64 {
    var a: CString = CString("Hello ")
    var b: CString = CString("World\n")
    var str: CString 
    unsafe { str = testfunc(a) }
    var substr1 = str.subCString(-1) // EXPECTED: regex the number '-1' exceeds the value range of type 'UInt64'
    unsafe { printf(str) }
    unsafe { printf(substr1) }
    str.free()
    substr1.free()
    if (substr1.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
