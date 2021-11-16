// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: scan Can not find foreign func 'testfunc1' from config files.

foreign func testfunc1(): Unit

unsafe func main():Int64 {
  testfunc1()
  return 0
}
