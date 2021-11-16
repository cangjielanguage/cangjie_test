// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I0{
  open class C1{} // EXPECTED: regex class type must be toplevel
  open class C2 <: C1{} // EXPECTED: regex class type must be toplevel
  class C3 <: C2{} // EXPECTED: regex class type must be toplevel
}
