// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex overflow in 'Power' calculation


func main(): Int64 {
   let a: Int8 = 0x4 ** 0x6

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
