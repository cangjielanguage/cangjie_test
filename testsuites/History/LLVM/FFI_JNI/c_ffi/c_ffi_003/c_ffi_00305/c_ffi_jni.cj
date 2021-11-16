// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %chirvic off %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: -32768032767
// ASSERT: scan after: -101

from ffi import c.*

foreign func testfunc(): CPointer<Int16>

unsafe func main():Int64 {
    var ptr: CPointer<Int16> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    var ptrtmp: CPointer<Int16> = ptr + 1
    print("before: ")
    print((ptrtmp - 1).read().toString())
    print(ptrtmp.read().toString())
    print((ptrtmp + 1).read().toString())

    if ((ptrtmp - 1).read() == -32768 && ptrtmp.read() == 0 && (ptrtmp + 1).read() == 32767) {
        (ptrtmp - 1).write(-1)
        ptr.write(1, 0)
        (ptrtmp + 1).write(1)
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
