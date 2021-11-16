// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex unexpected symbol here, expected '<:' to inherit or '{' to open a scope
interface te st{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
