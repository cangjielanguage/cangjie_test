// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'C1'
interface I0{
  abstract class C1{}
}

class C2 <: C1{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
