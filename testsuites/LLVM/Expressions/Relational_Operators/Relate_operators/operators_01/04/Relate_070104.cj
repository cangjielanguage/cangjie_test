// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment

func main(): Int64 {

    let a = 8
    let b = 10
    let c = 9

    a < b >= c

    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
