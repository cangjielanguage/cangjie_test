// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto expected '{' here
// ASSERT: regex-not stack trace

enum TimeUnit
// ASSERT: regex-not core dumped

