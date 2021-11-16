// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex inheritance cycle detected: 'I0->I5->I4->I3->I2->I1->I0'
interface I0 <: I5{}
interface I1 <: I0{}
interface I2 <: I1{}
interface I3 <: I2{}
interface I4 <: I3{}
interface I5 <: I4{}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
