// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'abstract' and 'open' are conflict in class declaration
interface I0{
  open abstract class C1{}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
