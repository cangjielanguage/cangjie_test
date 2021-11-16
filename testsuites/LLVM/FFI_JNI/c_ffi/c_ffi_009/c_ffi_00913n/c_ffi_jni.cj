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


unsafe func main():Int64 {

    let struct1 = teststruct(i8: 1, ui8: 1)
    func test() : ()->teststruct { match {case _ => {return struct1}} } // EXPECTED: regex captured variable mustn't be record with annotation @c
    
    testfunc(struct1) 

    return 0
}
