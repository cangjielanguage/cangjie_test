// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f

from ffi import c.*

unsafe func main():Int64 {
    unsafe foreign func testfunc(): CPointer<Bool> // EXPECTED: regex 'foreign' modifier is illegal for function declaration in function body

    var ptr: CPointer<Bool> = testfunc()

    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    if (!ptr.read(0) || ptr.read(1)) {
        return 3
    }

    print("CPointer Type Bool\n")
    return 0
}
