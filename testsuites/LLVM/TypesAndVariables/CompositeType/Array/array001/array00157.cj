// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected type
func main(): Int64 {
    let myArray : []
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
