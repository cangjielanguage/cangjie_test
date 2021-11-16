// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex inheritance cycle detected: 'I2->I3->I2'
interface I2 <: I3{}
interface I3 <: I2 &I3{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
