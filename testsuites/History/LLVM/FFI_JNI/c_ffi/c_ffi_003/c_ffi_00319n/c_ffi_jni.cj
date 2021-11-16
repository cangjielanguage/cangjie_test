// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC-PIPE-1: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f

from ffi import c.*

foreign func testfunc(): CPointer<Int8>

func main():Int64 {
    var ptr: CPointer<Int8> = testfunc() // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    var ptrtmp: CPointer<Int8> = ptr + 1
    print("before: ")
    print((ptrtmp - 1).read().toString()) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    print(ptrtmp.read().toString()) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    print((ptrtmp + 1).read().toString()) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context

    if ((ptrtmp - 1).read() == -128 && ptrtmp.read() == 0 && (ptrtmp + 1).read() == 127) { // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
        (ptrtmp - 1).write(-1) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
        ptr.write(1, 0) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
        (ptrtmp + 1).write(1) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    } else {
        return 3
    }

    print("\n")
    print("after: ")
    print(ptr.read(0).toString()) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    print(ptr.read(1).toString()) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    print(ptr.read(2).toString()) // EXPECTED: regex unsafe function or native function should be invoked in unsafe context
    return 0
}