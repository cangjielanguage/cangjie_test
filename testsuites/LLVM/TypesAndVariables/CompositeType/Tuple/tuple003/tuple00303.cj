// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'myTuple_0'
func main(): Int64 {
    var myTuple : Int32*Int32 = (0,1)
    var a = myTuple_0
    return a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
