// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass1\n
// ASSERT: scan Cangjie to C: \n
// ASSERT: scan bool: 1\nuint32_t: a\nint8_t: 127\nuint8_t: 255\nint16_t: 32767\nuint16_t: 65535\nint32_t: 2147483647\nuint32_t: 4294967295\nint64_t: 9223372036854770000\nuint64_t: 18446744073709500000\nfloat32: 34028235612225536.000000\nfloat64: 175439769543232323584.000000\n
// ASSERT: scan pass2\n
// ASSERT: scan-not Exception

from ffi import c.*

@c
record teststruct {
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

foreign func testfunc(st: teststruct):Int8

unsafe func main():Int64 {
    var struct1 = teststruct(b: true, ui32a: 'a', i8: 127, ui8: 255, i16: 32767, ui16: 65535, i32: 2147483647, ui32b: 4294967295, i64: 9223372036854770000, ui64: 18446744073709500000, f32: 34028234663852886.8, f64: 175439769543232322308.8)

    if ( (struct1.b == true ) && (struct1.ui32a == 'a') && (struct1.i8 == 127) && (struct1.ui8 == 255) && (struct1.i16 == 32767) && (struct1.ui16 == 65535) && (struct1.i32 == 2147483647) && (struct1.ui32b == 4294967295) && (struct1.i64 == 9223372036854770000) && (struct1.ui64 == 18446744073709500000) && (struct1.f32 == 34028234663852886.8) && (struct1.f64 == 175439769543232322308.8) ) {
        print("pass1\n")
    } else {
        print("fail1\n")
    }

    print("Cangjie to C: \n")
    testfunc(struct1)

    return 0
}
