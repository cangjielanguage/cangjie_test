// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration
func main(): Int64 {
    var myTuple : Int32*Int32 = (0,1)
    var a = myTuple.0
    return a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
