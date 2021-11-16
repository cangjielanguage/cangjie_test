// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto expected enum name after 'enum'

enum {
    Year | Month | Day | Hour
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
