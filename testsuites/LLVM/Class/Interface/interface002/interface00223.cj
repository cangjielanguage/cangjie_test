// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I1 {}
interface I2 <: I1 & I1 {} // EXPECTED: regex-auto interface 'I2' inherits or implements duplicate interface 'I1'

