// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan CPointer Type Bool\n

from ffi import c.*

foreign func testfunc(): CPointer<Bool>

class A {}

extend A {
    unsafe func test(ptr: CPointer<Bool>): Int64 {
        if (!ptr.isNotNull()) { return 1 }
        if (ptr.isNull()) { return 2 }
        if (!ptr.read(0) || ptr.read(1)) { return 3 }
        print("CPointer Type Bool\n")
        return 0
    }
}

unsafe func main():Int64 {
    var ptr: CPointer<Bool> = testfunc()
    var a: A = A()
    return a.test(ptr)
}
