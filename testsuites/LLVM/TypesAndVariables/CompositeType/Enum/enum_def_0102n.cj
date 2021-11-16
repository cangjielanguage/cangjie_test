// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto illegal object in toplevel

Enum TimeUnit {
    Year | Month | Day | Hour
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
