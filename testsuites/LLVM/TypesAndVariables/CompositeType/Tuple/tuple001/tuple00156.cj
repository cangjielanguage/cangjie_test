// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'MyTuple'
func main(): Int64 {
    var a : Int32 = 1
    var MyTuple : Int32*Int32 = (a,a,a)
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
