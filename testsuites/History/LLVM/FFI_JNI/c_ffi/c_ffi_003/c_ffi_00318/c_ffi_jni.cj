// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: cangjie

from ffi import c.*

foreign func printf(fmt: CString, ...): Int32
foreign func testfunc(): CPointer<CString>

unsafe func main():Int64 {
    var ptr: CPointer<CString> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    print("before: ")
    printf(ptr.read(0))
    printf(ptr.read(1))
    return 0
}
