// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal interface member in interface block
interface MyInterface{
  trait Addable {
           func plus(a: This, b: This): This
  }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
