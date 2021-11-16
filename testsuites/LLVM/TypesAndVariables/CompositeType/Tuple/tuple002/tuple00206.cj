// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex the pattern isn't irrefutable pattern and it can not be initialized
func main(): Int64 {
    var MyTuple = (0,0)
    var (1,2) = MyTuple
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
