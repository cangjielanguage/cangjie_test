// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

interface A {

    foreign func testfunc(): CPointer<Bool> // EXPECTED: regex 'foreign' modifier is illegal for function declaration in interface body
}

unsafe func main():Int64 {
    print("CPointer Type Bool\n")
    return 0
}
