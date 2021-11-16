// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'Test'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var Test = 1
record Test {
    let a: Int32 = 2
}
