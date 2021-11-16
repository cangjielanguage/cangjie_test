// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected '>' in the end of collection or tuple type or type parameters
func main(): Int64 {
    var myArray : Array<Array<Array<Array<Int32>>
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
