// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'internal' and 'external' are conflict in interface declaration
internal external interface MyInterface{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
