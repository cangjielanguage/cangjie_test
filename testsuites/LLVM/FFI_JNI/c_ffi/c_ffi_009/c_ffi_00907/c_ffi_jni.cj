// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass1\n
// ASSERT: scan int8_t: -128\nuint8_t: 255\nchar*: efg\n
// ASSERT: scan pass2\n
// ASSERT: scan-not Exception

from ffi import c.*

@c
record teststruct {
    var i8: Int8
    var ui8: UInt8
    var str: CString
}

foreign func testfunc1():teststruct

foreign func testfunc2(st: teststruct):Int8

unsafe func main():Int64 {
    print("1.CangJie get struct from C:\n")
    var a: CString = CString("abc")
    var struct1 = testfunc1()    
    if ( (struct1.i8 == 123) && (struct1.ui8 == 123) && struct1.str.equals(a)) {
        print("pass1\n")
    } else {
        print("fail1\n")
    }

    struct1.i8 = -128
    struct1.ui8 = 255
    struct1.str = CString("efg")
    testfunc2(struct1)

    return 0
}
