// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'private' modifier is illegal for interface declaration in top level
private interface MyInterface{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
