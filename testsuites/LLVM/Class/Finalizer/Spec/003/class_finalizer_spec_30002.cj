// DEPENDENCE: c_ffi_jni_2.c
// EXEC: %clang %clang_opt c_ffi_jni_2.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args

foreign func testfunc(): Int64

var a = 0
var b = 0

class A{
    ~init(){
        unsafe {
        a = testfunc()
        }
    }
}


func main():Int64 {
    var f = spawn {
            unsafe {b = testfunc()}
            A()
            NativeGC()
    }
    f.getResult()
    if (a == b) {
        return 1 // gc thread and spawn thread is not same.
    }
    return 0
}
