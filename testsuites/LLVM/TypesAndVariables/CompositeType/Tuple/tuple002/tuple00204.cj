// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration
func main(): Int64 {
    var MyTuple = (0,0,0)
    var a,b = MyTuple
    return a+b
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
