// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: 1270-128

from ffi import c.*

foreign func testfunc(input: CPointer<Int8>): CPointer<Int8>

unsafe func main():Int64 {
    var input: CPointer<Int8> = CPointer<Int8>()
    var ptr: CPointer<Int8> = testfunc(input)
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    print("before: ")
    print(ptr.read(0).toString())
    print(ptr.read(1).toString())
    print(ptr.read(2).toString())
    return 0
}
