// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var myArray1 : Array<Int32> = @{}
    var myArray2 : Array<Array<Int32>> ; @{@{}}
    return 0
}
