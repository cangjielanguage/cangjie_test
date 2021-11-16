// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f

from ffi import c.*

unsafe foreign func testfunc(): CPointer<Bool>

unsafe foreign func testfunc1(): CPointer<Bool> { // EXPECTED: regex foreign function can not have body
    return testfunc()
}

unsafe func main():Int64 {
    var ptr: CPointer<Bool> = testfunc1()

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
