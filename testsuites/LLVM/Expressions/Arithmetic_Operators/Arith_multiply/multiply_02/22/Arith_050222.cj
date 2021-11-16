// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan


func main(): Int64 {
   let a: Int8 = 0o10 * 0o20

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
