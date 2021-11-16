// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args

foreign func testfunc(a: UIntNative, b: UIntNative): UIntNative

unsafe func main():IntNative {
  if (testfunc(9223372036854775808, 9223372036854775809) == 18446744073709551615) {
    return 0
  }
  return 1
}
