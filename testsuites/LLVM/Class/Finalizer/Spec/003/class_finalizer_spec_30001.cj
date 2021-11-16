// DEPENDENCE: c_ffi_jni.c
// EXEC: %clang %clang_opt c_ffi_jni.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass
// ASSERT: scan Hello World

foreign func testfunc(): Unit


class A{
    ~init(){
        unsafe {
        if ( testfunc() == () ){
                print("pass\n")
            }
        }
    }
}


func main():Int64 {
  A()
  NativeGC()
  return 0
}
