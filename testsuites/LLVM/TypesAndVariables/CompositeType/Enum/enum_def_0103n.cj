// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'testname'

var testname = 1

enum testname {
    Year | Month | Day | Hour
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
