// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal interface member in interface block
interface MyInterface{
  func test():Int32{
    var i : Array<Int32>
    return 1
  }
  while (true) {return true}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
