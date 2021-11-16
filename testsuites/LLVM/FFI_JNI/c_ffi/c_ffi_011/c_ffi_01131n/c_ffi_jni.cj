// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f
// ASSERT: scan native function can only have CType return

foreign func testfunc(cb: CFunc<(Int8, Int8)->List<Int8>>): List<Int8>

var add_i8: CFunc<(Int8, Int8) -> List<Int8>> = {a: Int8, b: Int8 => return a[0] + b }

unsafe func main():Int64 {
    if ( testfunc(add_i8) == -128 ){
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
