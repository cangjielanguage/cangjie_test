// EXEC: %compiler %cmp_opt -verbose 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex Cangjie Compiler: .*? \(.*? \d{4}-\d{2}-\d{2}\)
