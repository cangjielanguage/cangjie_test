// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan i8a: -128\ni8b: 123\ni8c: 127\n
// ASSERT: scan-not Exception

foreign func testfunc(a: Int8): Int8

unsafe func main():Int64 {
    var i8a: Int8 = testfunc(-128)
    var i8b: Int8 = testfunc(123)
    var i8c: Int8 = testfunc(127)
    
    print("i8a: ${i8a}\n")
    print("i8b: ${i8b}\n")
    print("i8c: ${i8c}\n")

    return 0
}
