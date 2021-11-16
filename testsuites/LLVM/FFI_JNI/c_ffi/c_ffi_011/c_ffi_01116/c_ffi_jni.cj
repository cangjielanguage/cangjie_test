// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

foreign func testfunc(cb: CFunc<(UInt16, UInt16)->UInt16>): UInt16

@c
func add_ui16(a: UInt16, b: UInt16): UInt16 {
    var c: UInt16 = a + b
    print("a: " + a.toString() + "\n")
    print("b: " + b.toString() + "\n")
    print("c: " + c.toString() + "\n")
    return a + b 
}

unsafe func main():Int64 {
    if ( testfunc(add_ui16) == 65535 ){
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
