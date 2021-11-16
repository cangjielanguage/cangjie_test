// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args

foreign func testfunc(a: UInt64, b: UInt64): UInt64

unsafe func main():Int64 {
  if (testfunc(9223372036854775808, 9223372036854775809) == 18446744073709551615) {
    return 0
  }
  return 1
}
