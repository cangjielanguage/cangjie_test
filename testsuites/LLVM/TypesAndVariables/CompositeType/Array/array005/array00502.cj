// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex variable 'a' is used before initialization
func main(): Int64 {
    var a : Int32
    var b = a
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
