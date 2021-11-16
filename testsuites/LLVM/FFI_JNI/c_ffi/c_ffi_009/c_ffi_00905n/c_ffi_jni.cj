// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f
// ASSERT: scan-not error

from ffi import c.*

@c
record teststruct {
    var btmp: Bool
    var ui32atmp: Char
    var i8tmp: Int8
    var ui8tmp: UInt8
    var i16tmp: Int16
    var ui16tmp: UInt16
    var i32tmp: Int32
    var ui32btmp: UInt32
    var i64tmp: Int64
    var ui64tmp: UInt64
    var f32tmp: Float32
    var f64tmp: Float64
}

foreign func testfunc(st: teststruct):Int8

unsafe func main():Int64 {
    var struct1 = teststruct(btmp: true, ui32atmp: 'a', i8tmp: -128, ui8tmp: 255, i16tmp: -32768, ui16tmp: 65535, i32tmp: -2147483648, ui32btmp: 4294967295, i64tmp: -9223372036854770000, ui64tmp: 18446744073709500000, f32tmp: 34028234663852886.8, f64tmp: 175439769543232322308.8)
    print("\nCangjie to C: \n")
    testfunc(struct1)
    
    print("\nC to Cangjie: \n")
    print("b: " + struct1.btmp.toString())
    print("\nui32a: " + struct1.ui32atmp.toString())
    print("\ni8: " + struct1.i8tmp.toString())
    print("\nui8: " + struct1.ui8tmp.toString())
    print("\ni16: " + struct1.i16tmp.toString())
    print("\nui16: " + struct1.ui16tmp.toString())
    print("\ni32: " + struct1.i32tmp.toString())
    print("\nui32b: " + struct1.ui32btmp.toString())
    print("\ni64: " + struct1.i64tmp.toString())
    print("\nui64: " + struct1.ui64tmp.toString())
    print("\nf32: " + struct1.f32tmp.toString())
    print("\nf64: " + struct1.f64tmp.toString() + "\n")

    print("\nresult: ") 
    if ( (struct1.btmp == true ) && (struct1.ui32atmp == 'a') && (struct1.i8tmp == -128) && (struct1.ui8tmp == 255) && (struct1.i16tmp == -32768) && (struct1.ui16tmp == 65535) && (struct1.i32tmp == -2147483648) && (struct1.ui32btmp == 4294967295) && (struct1.i64tmp == -9223372036854770000) && (struct1.ui64tmp == 18446744073709500000) && (struct1.f32tmp == 34028235612225536.000000) && (struct1.f64tmp == 175439769543232323584.000000) ) {
        print("pass\n")
    } else {
        print("fail\n")
    }
    
    return 0
}
