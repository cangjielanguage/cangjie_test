// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World by cangjie testfunc1\nHello World by cangjie testfunc2\n

foreign {
  func testfunc1(): Unit
  func testfunc2(): Unit
}

unsafe func main():Int64 {
  testfunc1()
  testfunc2()
  return 0
}
