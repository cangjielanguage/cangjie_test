// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex cannot assign to value which is an initialized 'let' constant
func main(): Int64 {
    let myArray : Array<Int32> = {0}
    myArray = {1}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
