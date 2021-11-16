// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args

foreign func testfunc(a: Int64, b: Float64): Float64

unsafe func main():Int64 {
  if (testfunc(10, 3.14) < 3.1847133757962 && testfunc(10, 3.14) > 3.1847133757961) {
    return 0
  }
  return 1
}
