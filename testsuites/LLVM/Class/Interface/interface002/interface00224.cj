// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected '\{' in interface
interface I0{}
interface I1{}
interface I2 <: I0 I1 {}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
