// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto 'class' is keyword not identifier, you can use '`class`' instead
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace:anonymous namespace

record Test {
    let class: Int32 = 2
}

