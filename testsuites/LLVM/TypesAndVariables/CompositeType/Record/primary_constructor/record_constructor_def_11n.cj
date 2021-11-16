// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let a: Int32 = 1
    var b: Int32 = 2
    static Test() { // EXPECTED: regex 'static' modifier is illegal for constructor in record body
        a = 2
    }
}

