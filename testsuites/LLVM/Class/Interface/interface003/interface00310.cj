// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
trait update{}
interface I0<T>{
  interface I1<T> where T <: update{} // EXPECTED: regex interface type must be toplevel
}
