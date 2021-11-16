// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
interface I0 <: I2{ // EXPECTED: regex-auto inheritance cycle detected: 'I0->I2->I1->I3->I0'

  interface I1 <: I2.I3{}
}

interface I2 <: I0.I1{
  interface I3 <: I0{}
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
