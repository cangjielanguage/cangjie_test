// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

foreign func testfunc(cb: CFunc<(Bool, Bool)->Bool>): Bool

var and_b: CFunc<(Bool, Bool) -> Bool> = {a: Bool, b: Bool => return a && b }

unsafe func main():Int64 {
    if ( testfunc(and_b) == true ){
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
