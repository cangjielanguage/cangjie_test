// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

interface I3 <: I3{} // EXPECTED: regex illegal inheritance with same identifier 'I3'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
