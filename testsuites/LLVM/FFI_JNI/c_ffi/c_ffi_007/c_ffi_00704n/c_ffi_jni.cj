// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

foreign func testfunc(): CPointer<Int8>

unsafe func main():Int64 {
    var ptr: CPointer<Int8> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    var ptrtmp: CPointer<Int8> = ptr + 1
    print("before: ")
    print((ptrtmp - 1).read().toString())
    print(ptrtmp.read().toString())
    print((ptrtmp + 1).read().toString())

    if ((ptrtmp - 1).read() == -128 && ptrtmp.read() == 0 && (ptrtmp + 1).read() == 127) {
        (ptrtmp - 1).write(-129) // EXPECTED: regex the number '-129' exceeds the value range of type 'Int8'
        ptr.write(1, 0)
        (ptrtmp + 1).write(128) // EXPECTED: regex the number '128' exceeds the value range of type 'Int8'
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
