// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I0{
  open class C1{} // EXPECTED: regex class type must be toplevel
}

class C2 <: I0.C1{}
