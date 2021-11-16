// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto illegal object in toplevel
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

Record Test {
    let a = 2
}
