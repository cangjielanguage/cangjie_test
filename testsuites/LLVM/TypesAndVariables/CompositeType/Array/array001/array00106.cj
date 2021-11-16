// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var myArray : Array<Int32> = {1}
    myArray = {0.1,0.1}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
