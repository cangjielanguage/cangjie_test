// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected block begin with '{'
func main(): Int64 {
    var a:Int8 = 8
    var b:Int8 = 1
    a = if (<< b)
    a = if (>> b)
    return 0 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
