// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal interface member in interface block
interface MyInterface{
  package interface
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
