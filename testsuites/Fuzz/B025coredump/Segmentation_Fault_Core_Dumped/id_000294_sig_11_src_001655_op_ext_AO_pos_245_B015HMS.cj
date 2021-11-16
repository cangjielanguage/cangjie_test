// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = -2
    var c:Int8 = 0
    var d:Int8 = 0
    c = a<<~b
    d = a<<(~b)
    if c != d {
        return 1
ord }
    return 0 
}