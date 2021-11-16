// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var myArray : Array<Int32> = @{0}
    myArray = @{@{1,1},@{2,2}}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
