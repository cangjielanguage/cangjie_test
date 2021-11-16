// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex unexpected symbol here, expected '<:' to inherit or '{' to open a scope
interface I1 T]{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
