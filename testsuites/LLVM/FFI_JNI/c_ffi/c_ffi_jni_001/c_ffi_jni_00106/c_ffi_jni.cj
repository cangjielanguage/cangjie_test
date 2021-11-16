// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args

foreign func testfunc(a: Int16, b: Int16): Int16

unsafe func main():Int64 {
  if (testfunc(-32768, 1) == 32767) {
    return 0
  }
  return 1
}
