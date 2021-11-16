// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex internal' is keyword not identifier, you can use '`internal`' instead
interface MyInterface{
  let internal i : Int32 = 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
