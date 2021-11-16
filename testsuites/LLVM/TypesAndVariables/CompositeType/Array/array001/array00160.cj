// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected newline or ';' between expression or declaration
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    let myArray : Int32[
    return 1
}
