// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -1280127

from ffi import c.*

foreign func testfunc(): CPointer<CPointer<Int8>>

unsafe func main():Int64 {
    var ptr: CPointer<CPointer<Int8>> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    if (!ptr.read().isNotNull()) {
        return 3
    }

    if (ptr.read().isNull()) {
        return 4
    }

    print(ptr.read().read(0).toString())
    print(ptr.read().read(1).toString())
    print(ptr.read().read(2).toString())
    return 0
}
