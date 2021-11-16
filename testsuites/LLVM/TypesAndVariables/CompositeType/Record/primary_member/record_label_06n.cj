// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto expected variable pattern, tuple pattern or enum pattern after 'let'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace:anonymous namespace

record Test {
    let class: Int32 = 2
}

