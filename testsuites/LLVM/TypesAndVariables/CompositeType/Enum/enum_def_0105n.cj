// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto 'as' is keyword not identifier

enum as {
    Year | Month | Day | Hour
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
