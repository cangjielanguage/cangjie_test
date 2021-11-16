// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan bool: 1\nuint32_t: a\nint8_t: -128\nuint8_t: 255\n
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

from ffi import c.*

@c
record teststruct {
    var b: Bool
    var ui32a: Char
    var i8: Int8
    var ui8: UInt8
}

@rename["structfunc"]
foreign func newstructfunc(st: teststruct):Int8


unsafe func main():Int64 {

    var newstruct = teststruct(b: true, ui32a: 'a', i8: -128, ui8: 255)

    newstructfunc(newstruct)

    if ( (newstruct.b == true ) && (newstruct.ui32a == 'a') && (newstruct.i8 == -128) && (newstruct.ui8 == 255) ) {
        print("pass\n")
    } else {
        print("fail\n")
    }

    return 0
}
