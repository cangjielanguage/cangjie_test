// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex Unmatched ']' found
func main(): Int64 {
    let myArray : Int32]
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
