// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a: Int32 = 1
    var b: Int32 = 2
    init(a1: Int32) {
        a = a1
        return 0 //EXPECTED: regex either 'Unit expression' or 'no expression' after 'return' is allowed in a constructor
    }
}

