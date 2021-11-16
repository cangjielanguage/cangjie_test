// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan -56
// will not exception.

@overflowThrowing
foreign func testfunc(a: Int8, b: Int8): Int8

unsafe func main():Int64 {
  var res = testfunc(100,100)
  print("${res}\n")
  return 0
}
