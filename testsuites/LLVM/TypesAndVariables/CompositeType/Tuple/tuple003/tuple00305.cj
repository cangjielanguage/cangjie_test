// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myTuple : Int64*Int64 = (0,1)
    var a = myTuple [ 0]
    return a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
