// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a:Float32 = 1.2
    var b:Int8 = 0
    b = a << 2     
    b = a >> 2    
    return 1
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
