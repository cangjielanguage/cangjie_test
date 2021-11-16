// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this assignment
func main(): Int64 {
    var a:float = 1.2
    var b:Int8 = 0
    b = a | a     //暂未想好报错方式
    return 0 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
