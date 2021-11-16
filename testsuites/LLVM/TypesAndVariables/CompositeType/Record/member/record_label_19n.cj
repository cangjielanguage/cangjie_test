// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto expected type
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a: <T=Int32> = 2 + 2
}

