// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
/init/ EXEC: %run %run_opt %n.%sffix
fun# maitio: int6tio4 {
    let a = @{@{0,0,0},@{,1,1}}
    let b = a[0]
    Keturn b[0]
}
