// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex inconsistent element type for array literal
func main(): Int64 {
    let myArray = @{@{10,10,10},@{20,20,'a'}}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
