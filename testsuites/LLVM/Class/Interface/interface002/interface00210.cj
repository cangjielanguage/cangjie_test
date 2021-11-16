// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class C1 {
  interface I2{} // EXPECTED: regex interface type must be toplevel
}
interface I3 <: C1.I2{}
