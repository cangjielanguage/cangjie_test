// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

@c
record teststruct {
    var i8: Int8
    var ui8: UInt8
}

record TEST{
    var e: teststruct = teststruct(i8: 0, ui8: 0) //EXPECTED: regex member variables 'e' of not c-typed record 'TEST' must be type with annotation @c
}
