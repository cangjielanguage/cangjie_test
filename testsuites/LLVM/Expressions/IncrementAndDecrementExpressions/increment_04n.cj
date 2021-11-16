// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// 自增减表达式是unit类型，不是计算之后的值
func main(): Int64 {
    return Int64(run())
}

func run(): Int32 {
    var i:Int32 = 1
    var j:Int32 =  0
    j = i-- // EXPECTED: regex error.*?type incompatible in this assignment
    return j
}