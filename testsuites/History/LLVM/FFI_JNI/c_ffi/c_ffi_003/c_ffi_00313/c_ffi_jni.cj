// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: 3.140.0-3.14
// ASSERT: scan after: -3.140.03.14

from ffi import c.*

foreign func testfunc(): CPointer<Float32>

unsafe func main():Int64 {
    var ptr: CPointer<Float32> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    var ptrtmp: CPointer<Float32> = ptr + 1
    print("before: ")
    print((ptrtmp - 1).read().toString())
    print(ptrtmp.read().toString())
    print((ptrtmp + 1).read().toString())

    if ((ptrtmp - 1).read() < 3.140001 && (ptrtmp - 1).read() > 3.139999 && ptrtmp.read() < 0.000001 && (ptrtmp + 1).read() < -3.139999 && (ptrtmp + 1).read() > -3.140001) {
        (ptrtmp - 1).write(-3.14)
        ptr.write(1, 0.0)
        (ptrtmp + 1).write(3.14)
    } else {
        return 3
    }

    print("\n")
    print("after: ")
    print(ptr.read(0).toString())
    print(ptr.read(1).toString())
    print(ptr.read(2).toString())
    return 0
}
