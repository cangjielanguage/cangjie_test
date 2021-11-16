// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I1{
}

record Test <: I1{
    let a: Int32 = 0
    var b: Int32 = 0
}

