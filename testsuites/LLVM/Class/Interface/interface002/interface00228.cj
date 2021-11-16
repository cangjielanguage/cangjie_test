// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I0 {
  interface I1 <: I0{} // EXPECTED: regex interface type must be toplevel
}

