// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan


func main(): Int64 {
   let a: Int8 = 0x8 * 0x10

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
