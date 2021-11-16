// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto 'class' is keyword not identifier
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record class {
    let a: Int32 = 2
}
