// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex interface type must be toplevel
open class C1 {
  private interface I1{}
}

class C2 <: C1{
  interface I2 <: C1.I1 {}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
