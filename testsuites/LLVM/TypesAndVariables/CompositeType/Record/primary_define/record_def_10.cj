// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Test {}
