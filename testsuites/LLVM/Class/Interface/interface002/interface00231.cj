// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I0 {
  interface I0 <: I2{} // EXPECTED: regex interface type must be toplevel
}

interface I2 <: I0{ //issue890,fixed
}

