// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

interface I0{
  class C1{} // EXPECTED: regex class type must be toplevel
  class C2 <: C1{} // EXPECTED: regex class type must be toplevel
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
