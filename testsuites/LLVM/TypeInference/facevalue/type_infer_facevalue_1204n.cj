// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    // 无类型表达式和有类型表达式 -> 有类型表达式
    var num: Int32 = 2
    let x : Float64 = 1.0 + 3
    let y : Float32 = 1.0 + 3
    let z : Float32 = 2 + 3
    let w : Int32 = 2.0 + 3   // EXPECTED: regex invalid binary operator '\+' on type 'Float' and 'Int'
    let u : Float32 = num + 3 // EXPECTED: regex initializer's type is incompatible with variable declaration 'u'

    return 0
}
