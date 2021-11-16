// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a = "abcdefg12345"
    var b:Int8 = 0
    b = !a
    return 1 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
