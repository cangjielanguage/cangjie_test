// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto illegal record member in record block
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

record Test {
    let a: Int32 = 1
    a = 3
}

