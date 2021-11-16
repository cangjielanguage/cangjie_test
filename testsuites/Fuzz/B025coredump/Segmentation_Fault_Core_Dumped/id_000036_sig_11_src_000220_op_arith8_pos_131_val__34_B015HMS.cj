// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var myArray : Array<Int64> = @{1[
    myArray = @{0}
    return myArray[0]
}
