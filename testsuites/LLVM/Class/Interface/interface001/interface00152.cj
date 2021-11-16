// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex backquote identifier is empty
interface ``test``{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
