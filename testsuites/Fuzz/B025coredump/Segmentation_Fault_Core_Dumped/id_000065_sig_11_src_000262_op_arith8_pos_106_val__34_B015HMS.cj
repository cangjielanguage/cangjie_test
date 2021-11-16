// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
var myArray : Array<Int64> = @{0[

func main(): Int64 {
    return myArray[0]
}
