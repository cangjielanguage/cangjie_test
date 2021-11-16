// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Cang Jie Programming Language\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString

unsafe func main():Int64 {

    var region = Region()

    var str1 = region.mallocCString("Cang")
    var str2 = region.mallocCString(" Jie")
    var str3 = region.mallocCString(" Programming")
    var str4 = region.mallocCString(" Language\n")

    printf(str1)
    printf(str2)
    printf(str3)
    printf(str4)

    var res: CString = testfunc(str1)
    printf(res)

    region.close()

    return 0

}
