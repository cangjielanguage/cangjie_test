// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString

unsafe func main():Int64 {

    var region = Region()
    var str = region.mallocCString(1)
    str = CString("Hello")
    var res: CString = testfunc(str)
    printf(res)

    region.close()
    
    return 0
}
