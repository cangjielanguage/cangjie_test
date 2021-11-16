// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan


func main(): Int64 {

    let a: UInt16 = 256 * 256

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
