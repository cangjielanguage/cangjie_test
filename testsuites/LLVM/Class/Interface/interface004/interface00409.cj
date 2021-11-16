// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal object in toplevel, toplevel must consist of declaration or definition
interface MyInterface{
  enum Timeunit { Year }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
