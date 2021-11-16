// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f
// ASSERT: scan-not error

from ffi import c.*

@c
record teststructtmp {
    var b: Bool
    var ui32a: Char
    var i8: Int8
    var ui8: UInt8
    var i16: Int16
    var ui16: UInt16
    var i32: Int32
    var ui32b: UInt32
    var i64: Int64
    var ui64: UInt64
    var f32: Float32
    var f64: Float64
}

foreign func testfunc(st: teststructtmp):Int8

unsafe func main():Int64 {
    var struct1 = teststructtmp(b: true, ui32a: 'a', i8: -128, ui8: 255, i16: -32768, ui16: 65535, i32: -2147483648, ui32b: 4294967295, i64: -9223372036854770000, ui64: 18446744073709500000, f32: 34028234663852886.8, f64: 175439769543232322308.8)
    print("\nCangjie to C: \n")
    testfunc(struct1)
    
    print("\nC to Cangjie: \n")
    print("b: " + struct1.b.toString())
    print("\nui32a: " + struct1.ui32a.toString())
    print("\ni8: " + struct1.i8.toString())
    print("\nui8: " + struct1.ui8.toString())
    print("\ni16: " + struct1.i16.toString())
    print("\nui16: " + struct1.ui16.toString())
    print("\ni32: " + struct1.i32.toString())
    print("\nui32b: " + struct1.ui32b.toString())
    print("\ni64: " + struct1.i64.toString())
    print("\nui64: " + struct1.ui64.toString())
    print("\nf32: " + struct1.f32.toString())
    print("\nf64: " + struct1.f64.toString() + "\n")

    print("\nresult: ") 
    if ( (struct1.b == true ) && (struct1.ui32a == 'a') && (struct1.i8 == -128) && (struct1.ui8 == 255) && (struct1.i16 == -32768) && (struct1.ui16 == 65535) && (struct1.i32 == -2147483648) && (struct1.ui32b == 4294967295) && (struct1.i64 == -9223372036854770000) && (struct1.ui64 == 18446744073709500000) && (struct1.f32 == 34028235612225536.000000) && (struct1.f64 == 175439769543232323584.000000) ) {
        print("pass\n")
    } else {
        print("fail\n")
    }
    
    return 0
}
