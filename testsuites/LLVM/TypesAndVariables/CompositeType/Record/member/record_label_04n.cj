// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'a'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a: Int32 = 2
    let a: Int32 = 4
}

