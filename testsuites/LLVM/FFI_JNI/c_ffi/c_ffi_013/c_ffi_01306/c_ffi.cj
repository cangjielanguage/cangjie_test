// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Cang1 Jie1 Programming1 Language1\n
// ASSERT: scan Cang2 Jie2 Programming2 Language2\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(fmt: CString): CString

unsafe func main():Int64 {

    var region1 = Region()

    var str1 = region1.mallocCString("Cang1")
    var str2 = region1.mallocCString(" Jie1")
    var str3 = region1.mallocCString(" Programming1")
    var str4 = region1.mallocCString(" Language1\n")

    printf(str1)
    printf(str2)
    printf(str3)
    printf(str4)

    region1.close()

    var region2 = Region()

    var str5 = region2.mallocCString("Cang2")
    var str6 = region2.mallocCString(" Jie2")
    var str7 = region2.mallocCString(" Programming2")
    var str8 = region2.mallocCString(" Language2\n")

    printf(str5)
    printf(str6)
    printf(str7)
    printf(str8)

    region2.close()

    return 0

}
