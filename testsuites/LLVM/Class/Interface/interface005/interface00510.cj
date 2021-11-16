// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex abstract function must have return type
interface MyInterface{
  func testDefault()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
