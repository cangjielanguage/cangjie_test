// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'protected' modifier is illegal for interface declaration in top level
protected interface MyInterface{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
