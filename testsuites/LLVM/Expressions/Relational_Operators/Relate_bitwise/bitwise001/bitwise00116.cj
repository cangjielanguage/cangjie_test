// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expression of Nothing type cannot appear here currently
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 0
    b = !    return 1 //STATUS_PASSED
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
