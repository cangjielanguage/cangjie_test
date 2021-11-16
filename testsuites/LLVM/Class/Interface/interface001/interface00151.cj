// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex unexpected symbol here, expected '<:' to inherit or '{' to open a scope
interface test`test`test{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
