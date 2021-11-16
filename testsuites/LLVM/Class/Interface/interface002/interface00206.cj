// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'I0'
interface I3 <: I0{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
