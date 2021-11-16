// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass1\n
// ASSERT: scan Cangjie to C: \n
// ASSERT: scan bool: 1\nuint32_t: a\nint8_t: 111\nuint8_t: 111\nint16_t: 11111\nuint16_t: 11111\nint32_t: 1111111111\nuint32_t: 1111111111\nint64_t: 11111111111111\nuint64_t: 111111111111111\n
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
    var struct1 = teststruct(b: true, ui32a: 'a', i8: 111, ui8: 111, i16: 11111, ui16: 11111, i32: 1111111111, ui32b: 1111111111, i64: 11111111111111, ui64: 111111111111111, f32: 111.1, f64: 111111.1)

    if ( (struct1.b == true ) && (struct1.ui32a == 'a') && (struct1.i8 == 111) && (struct1.ui8 == 111) && (struct1.i16 == 11111) && (struct1.ui16 == 11111) && (struct1.i32 == 1111111111) && (struct1.ui32b == 1111111111) && (struct1.i64 == 11111111111111) && (struct1.ui64 == 111111111111111) && (struct1.f32 == 111.1) && (struct1.f64 == 111111.1) ) {
        print("pass1\n")
    } else {
        print("fail1\n")
    }

    print("Cangjie to C: \n")
    testfunc(struct1)

    return 0
}
