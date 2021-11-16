// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a:Unit = ()
    var b:Int8 = 0
    b = a << 120
    b = a >> 120
    return 0 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
