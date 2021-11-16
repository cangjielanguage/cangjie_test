// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type check of BinaryExpr fails


func main(): Int64 {
    let a: Float16 =  -65504.0 - 0.1

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
