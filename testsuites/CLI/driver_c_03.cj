// EXEC: %compiler %cmp_opt -c 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?expected at least one source code file when compiling source code
