// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

from ffi import c.*

foreign func testfunc(): Int8

enum A {
    | f(Int8)
    | f(Int8, Int8, Int8)
}

unsafe func f(a: Int8): Int8{
    var p:Int8 = a + 1
    return p
}

unsafe func f(a: Int8, b: Int8, c: Int8): Int8{
    var q:Int8 = a + b + c
    return q
}

unsafe func main():Int64 {
    var x: Int8 = testfunc()
    var m: Int8 = f(x)
    var n: Int8 = f(x,1,1)

    if ( (m == 2) && (n == 3) ){
        print("pass\n")
    }
    return 0
}
