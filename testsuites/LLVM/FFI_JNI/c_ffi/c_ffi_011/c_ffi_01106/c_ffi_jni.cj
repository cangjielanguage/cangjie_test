// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

foreign func testfunc(cb: CFunc<(Int32, Int32)->Int32>): Int32

var add_i32: CFunc<(Int32, Int32) -> Int32> = {a: Int32, b: Int32 => return a + b }

unsafe func main():Int64 {
    if ( testfunc(add_i32) == 3 ){
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
