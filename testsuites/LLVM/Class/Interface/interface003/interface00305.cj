// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected '\>' in the end of collection or tuple type or type parameters
interface I1<T {}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
