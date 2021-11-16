// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex inconsistent element type for array literal
func main(): Int64 {
    let myArray = @{@{1},@{'1'}}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
