// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

foreign func testfunc(cb: CFunc<(Int8, Int8)->Int8>): Int8

func add_i8(a: Int8, b: Int8): Int8 { return a + b }

unsafe func main():Int64 {
    if ( testfunc(add_i8) == -128 ){ // EXPECTED: regex-auto argument is mismatched with parameter type 'CFunc<(Int8, Int8) -> Int8>'
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
