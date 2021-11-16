// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected interface name after 'interface'
interface #${}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
