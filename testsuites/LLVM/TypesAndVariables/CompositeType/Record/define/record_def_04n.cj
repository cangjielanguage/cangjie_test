// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto expected identifier here
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record  {
    let a: Int32 = 2
}
