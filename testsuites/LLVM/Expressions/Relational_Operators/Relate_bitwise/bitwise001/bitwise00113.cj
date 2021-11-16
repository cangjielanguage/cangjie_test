// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible
func main(): Int64 {
    var a:Unit = ()
    var b:Int8 = 0
    b = !a
    return 1 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
