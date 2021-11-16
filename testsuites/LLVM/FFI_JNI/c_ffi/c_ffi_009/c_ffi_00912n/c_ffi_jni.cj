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

foreign func testfunc(st: teststruct):Int8

enum testenum {
    | Var1(Int8)
    | Var2(teststruct) // EXPECTED: regex member func 'Var2' of enum 'testenum' mustn't has struct with annotation @c
    | Var3(UInt8)
}

unsafe func main():Int64 {
    var struct1 = teststruct(i8: 111, ui8: 111)
    testfunc(struct1)

    return 0
}
