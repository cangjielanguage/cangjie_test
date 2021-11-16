// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'Int32' is keyword not identifier
interface Int32{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
