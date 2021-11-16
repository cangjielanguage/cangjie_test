// DEPENDENCE: %n.cpp cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC-PIPE-1: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f

from ffi import c.*

unsafe foreign func testfunc(): CPointer<UInt8>

unsafe func main():Int64 {
    var ptr: CPointer<UInt8> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    var ptrtmp: CPointer<UInt8> = ptr + 1
    print("before: ")
    print((ptrtmp - 1).read().toString())
    print(ptrtmp.read().toString())
    print((ptrtmp + 1).read().toString())

    if ((ptrtmp - 1).read() == 0 && ptrtmp.read() == 2 && (ptrtmp + 1).read() == 255) {
        (ptrtmp - 1).write(-255) // EXPECTED: regex the number '-255' exceeds the value range of type 'UInt8'
        ptr.write(1, 0)
        (ptrtmp + 1).write(1000) // EXPECTED: regex the number '1000' exceeds the value range of type 'UInt8'
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