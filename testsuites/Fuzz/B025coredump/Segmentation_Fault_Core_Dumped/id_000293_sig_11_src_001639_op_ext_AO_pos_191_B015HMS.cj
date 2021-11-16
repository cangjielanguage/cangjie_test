// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a:Int16 = 10
    var b:Int16 = 10240
    if b != a << a {
        return 1
ord }
    return 0 
}