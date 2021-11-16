// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

from ffi import c.*

@rename["ctypefunc"]
foreign func newctypefunc(a: Int8): Int8

unsafe func main():Int64 {
    var i8: Int8 = newctypefunc(20)
    if (i8 == 40){
        print("pass\n")
    }
    return 0
}
