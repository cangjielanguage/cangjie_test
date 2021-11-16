// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a = 1
    init(a: Int64) {
        this.a =a
    }
}

