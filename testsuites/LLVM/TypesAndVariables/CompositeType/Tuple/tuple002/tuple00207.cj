// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'a'
func main(): Int64 {
    var MyTuple = (0,0)
    var a : Int32 = 1
    var (a,b) = MyTuple
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
