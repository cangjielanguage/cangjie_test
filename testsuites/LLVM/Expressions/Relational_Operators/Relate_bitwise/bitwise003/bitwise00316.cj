// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type of function body is incompatible with return type
func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 0
    b = a &      //暂未想好报错方式
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
