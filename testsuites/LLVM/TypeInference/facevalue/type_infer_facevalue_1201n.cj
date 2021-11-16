// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// 两个无类型整型表达式进行类型一致性运算 -> 无类型整型

func main(): Int64 {
    var i1 = 1 + 1 // 无类型整型 -> Int64
    var i2 = 3 - 1
    var i3 = 2 * 1
    var i4 = 4 / 2
    var i5 = 5 % 3

    var flag1: Int32 = 2
    var res1 = i1 == flag1 // EXPECTED: regex invalid binary operator '==' on type 'Int64' and 'Int32'
    var res2 = i2 == flag1 // EXPECTED: regex invalid binary operator '==' on type 'Int64' and 'Int32'
    var res3 = i3 == flag1 // EXPECTED: regex invalid binary operator '==' on type 'Int64' and 'Int32'
    var res4 = i4 == flag1 // EXPECTED: regex invalid binary operator '==' on type 'Int64' and 'Int32'
    var res5 = i5 == flag1 // EXPECTED: regex invalid binary operator '==' on type 'Int64' and 'Int32'

return 0
}
