// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
open class C1 {
  public interface I1{} // EXPECTED: regex interface type must be toplevel
}

class C2 <: C1{
  interface I2 <: C1.I1 {} // EXPECTED: regex interface type must be toplevel
}
