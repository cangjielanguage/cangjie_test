// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan i16a: -32768\ni16b: 123\ni16c: 32767\n
// ASSERT: scan-not Exception

foreign func testfunc(a: Int16): Int16

unsafe func main():Int64 {
    var i16a: Int16 = testfunc(-32768)
    var i16b: Int16 = testfunc(123)
    var i16c: Int16 = testfunc(32767)

    print("i16a: ${i16a}\n")
    print("i16b: ${i16b}\n")
    print("i16c: ${i16c}\n")
    
    return 0
}
