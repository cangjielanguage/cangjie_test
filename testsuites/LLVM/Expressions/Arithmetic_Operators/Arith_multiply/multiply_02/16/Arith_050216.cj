// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan


func main(): Int64 {

   let a: Int64 = 2147483648 * 4294967296

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
