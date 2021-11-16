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

foreign func testfunc0(): CPointer<Char>

@c
record teststruct {
    var i8: Int8
    var ui8: UInt8
    var ptr: CPointer<UInt8>
}

foreign func testfunc1():teststruct

foreign func testfunc2(st: teststruct):Int8

unsafe func main():Int64 {
    print("1.CangJie get struct from C:\n")
    var struct1 = testfunc1()
    // 'a': 97; 'b': 98; 'c': 99
    if ( (struct1.i8 == 123) && (struct1.ui8 == 123) && (struct1.ptr.read(0) == 97) && (struct1.ptr.read(1) == 98) && (struct1.ptr.read(2) == 99)) {
        print("pass1\n")
    } else {
        print("fail1\n")
    }

    struct1.i8 = -128
    struct1.ui8 = 255
    struct1.ptr.write(0, 101) // 'e': 101
    struct1.ptr.write(1, 102) // 'f': 102
    struct1.ptr.write(2, 103) // 'g': 103
    testfunc2(struct1)

    return 0
}
