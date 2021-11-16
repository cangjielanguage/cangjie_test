// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex array size must be of type Int64
func main(): Int64{
    var myArray = Array<Int32>(1>0,0)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
