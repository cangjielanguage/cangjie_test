// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'Year'


enum TimeUnit {
    Year | Year
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
