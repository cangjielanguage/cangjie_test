// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex overflow in 'Power' calculation


func main(): Int64 {

    let a: UInt64 = 15 ** 17

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
