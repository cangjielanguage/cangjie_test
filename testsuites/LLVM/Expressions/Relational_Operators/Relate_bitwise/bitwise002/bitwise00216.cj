// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a:Int32 = -2147483648
    a =  << 120
    a =  >> 120
    return 0 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
