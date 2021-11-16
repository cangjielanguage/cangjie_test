// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'a'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    let a: Int32 = 1
    let a: Int32 = 2
}
