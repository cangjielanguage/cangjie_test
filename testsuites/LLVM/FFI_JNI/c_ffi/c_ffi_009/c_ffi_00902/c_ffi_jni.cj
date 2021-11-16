// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass1\n
// ASSERT: scan Cangjie to C: \n
// ASSERT: scan bool: 1\nuint32_t: a\nint8_t: -128\nuint8_t: 0\nint16_t: -32768\nuint16_t: 0\nint32_t: -2147483648\nuint32_t: 0\nint64_t: -9223372036854770000\nuint64_t: 0\nfloat32: 34028235612225536.000000\nfloat64: 175439769543232323584.000000\n
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
      var struct1 = teststruct(b: true, ui32a: 'a', i8: -128, ui8: 0, i16: -32768, ui16: 0, i32: -2147483648, ui32b: 0, i64: -9223372036854770000, ui64: 0, f32: 34028234663852886.8, f64: 175439769543232322308.8)

    print("\nCangjie to C: \n")
    testfunc(struct1)

    print("\nresult: ")
    if ( (struct1.b == true ) && (struct1.ui32a == 'a') && (struct1.i8 == -128) && (struct1.ui8 == 0) && (struct1.i16 == -32768) && (struct1.ui16 == 0) && (struct1.i32 == -2147483648) && (struct1.ui32b == 0) && (struct1.i64 == -9223372036854770000) && (struct1.ui64 == 0) && (struct1.f32 == 34028235612225536.000000) && (struct1.f64 == 175439769543232323584.000000) ) {
        print("pass2\n")
    } else {
        print("fail2\n")
    }

    return 0
}
