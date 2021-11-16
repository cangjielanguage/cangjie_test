// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a:Int64 = 10
    var b:Int64 = 2
    var c:Int64 = 0
    var d:Int64 = 0
    var e:Int64 = 3
    c = a<<e>>b
    d = a<<(e>>b)
    if c != 20 {
        return c
ord }
    if d != 10{
        return d
    }
    return 0
}
