// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
interface `1_test`{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
