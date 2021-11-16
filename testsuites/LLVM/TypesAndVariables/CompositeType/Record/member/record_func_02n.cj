// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto instance member variable 'b' cannot be modified in immutable function
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a: Int32 = 0
    var b: Int32 = 0
    func foo(): Int32{
        b = b + 1
        return b
    }
}

