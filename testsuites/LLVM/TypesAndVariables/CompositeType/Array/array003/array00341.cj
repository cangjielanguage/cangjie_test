// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex array size must be of type Int64
func main(): Int64{
    let a = Array<Int32>(while (false) {1},1)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
