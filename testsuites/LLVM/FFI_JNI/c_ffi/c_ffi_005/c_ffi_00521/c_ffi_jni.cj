// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan i32a: -2147483648\ni32b: 123\ni32c: 2147483647\n
// ASSERT: scan-not Exception

foreign func testfunc(a: Int32): Int32

unsafe func main():Int64 {
    var i32a: Int32 = testfunc(-2147483648)
    var i32b: Int32 = testfunc(123)
    var i32c: Int32 = testfunc(2147483647)

    print("i32a: ${i32a}\n")
    print("i32b: ${i32b}\n")
    print("i32c: ${i32c}\n")
    
    return 0
}
