// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex super class 'C1' is not inheritable, use 'open' modifier instead
interface I0{
  class C1{}
}

class C2 <: I0.C1{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
