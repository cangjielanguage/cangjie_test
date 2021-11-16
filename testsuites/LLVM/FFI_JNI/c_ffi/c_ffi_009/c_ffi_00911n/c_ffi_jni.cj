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

record Test {
    let a: teststruct*Int8  // EXPECTED: regex-auto tuple member mustn't be record with annotation @c
    let b: Int8
}

foreign func testfunc(st: teststruct):Int8

unsafe func main():Int64 {
    let tuplea: teststruct*Int8 // EXPECTED: regex-auto tuple member mustn't be record with annotation @c
    var struct1 = teststruct(i8: 111, ui8: 111)
    testfunc(struct1)

    return 0
}
