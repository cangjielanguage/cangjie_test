// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected identifier here
interface I1<>{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
