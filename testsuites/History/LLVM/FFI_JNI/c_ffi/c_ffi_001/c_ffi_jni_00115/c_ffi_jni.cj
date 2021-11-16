// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args

foreign func testfunc1(a: Int64, b: Int64): Int64
foreign func testfunc2(a: Int64, b: Int64): Int64

unsafe func main():Int64 {
  if (testfunc1(1, -1) == testfunc2(-1, 3)) {
    return 0
  }
  return 1
}
