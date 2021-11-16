// DEPENDENCE: %n.c ffi%n.c
// EXEC: %clang %clang_opt ffi%n.c -o libffi%n.so
// EXEC: %compiler %f %cffi_runtime_ld -o lib%n.so
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %clang %cffi_runtime_link %n.c -L. -l%n -o %n
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH ./%n 2>&1 | compare %f
// ASSERT: scan pass1
// ASSERT: scan pass2

from ffi import c.*

foreign func testfunc(ptr1: CPointer<Int8>): CPointer<Int8>

@c
external func cjFunc(ptr1: CPointer<Int8>): CPointer<Int8> {

    unsafe {
        if ( (ptr1.read(0) == -128) && (ptr1.read(1) == 0) && (ptr1.read(2) == 127)){
            println("pass1")
        }
    }

    unsafe { testfunc(ptr1) }

    return ptr1
}