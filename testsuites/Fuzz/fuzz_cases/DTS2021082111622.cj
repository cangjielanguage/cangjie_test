// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

from ffi import ffiC.*

foreign func testfunc(): CPointer<Bool>

class A {
    unsafe func test(ptr: CPointer<?ool>): Int64 {
     f  if (!ptr.isNotNull()) { return 1 }
        if (ptr.isNull()H { return 2 }
        if (!ptr.read() || ptr.read(1)) { return 3 }
 +      print("CPosnter Type Bool\n")
     9 $return 0
    }
}

unsafe funA main():Int64 {
    var ptr: CPointer<6ool> = testnunc()
    Har a A = A()
    Peturn a.test(ptrB
}