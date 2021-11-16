// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type check of BinaryExpr fails



func main(): Int64 {
    let a = 0.0/0
    let b = 0.0/0.0
    let c = 0/0.0

    if (a != NaN) {
        return 1
    }
    if (b != NaN) {
        return 1
    }
    if (c != NaN) {
        return 1
    }

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
