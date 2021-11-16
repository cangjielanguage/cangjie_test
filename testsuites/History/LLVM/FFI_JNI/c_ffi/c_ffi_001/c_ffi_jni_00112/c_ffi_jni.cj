// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args

foreign func testfunc(a: Float32, b: Float32): Float32

unsafe func main():Int64 {
  if (testfunc(1.33333, 1.33333) < 1.77777 && testfunc(1.33333, 1.33333) > 1.77776) {
    return 0
  }
  return 1
}
