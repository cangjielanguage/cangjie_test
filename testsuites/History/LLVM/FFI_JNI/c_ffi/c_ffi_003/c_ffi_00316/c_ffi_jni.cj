// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: 979899
// ASSERT: scan after: abc

from ffi import c.*

foreign func testfunc(): CPointer<UInt32>

unsafe func main():Int64 {
    var ptr: CPointer<UInt32> = testfunc()
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
    var ptrtmp: CPointer<Char> = CPointer<Char>(ptr)
    print("\n")
    print("after: ")
    print(ptrtmp.read(0).toString())
    print(ptrtmp.read(1).toString())
    print(ptrtmp.read(2).toString())
    return 0
}