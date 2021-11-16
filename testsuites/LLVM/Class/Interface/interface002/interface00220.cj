// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class C1 {
  public interface I1{} // EXPECTED: regex interface type must be toplevel
  interface I2 <: I1 {} // EXPECTED: regex interface type must be toplevel
}
