// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto record's constructor should have function body
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a: Int32 = 1
    var b: Int32 = 2
    init(a1: Int32, b1: Int32)
}

