// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a:Bool = true
    var b:Int32 = 0
    b = a << 120
    b = a >> 120
    return 1
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
