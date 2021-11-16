// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    let a = 0
    var myArray : Array<Array<Int32>>
    myArray = @{@{@{a,1}}}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
