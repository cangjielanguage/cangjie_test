// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex overflow in 'Addition' calculation


func main(): Int64 {
   let a: Int16 = -32666 + -103

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
