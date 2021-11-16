// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a:Int8 = 8
    var b:String = "abcdefghi123456"
    a = 12 << b
    a = 12 >> b
    return 0 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
