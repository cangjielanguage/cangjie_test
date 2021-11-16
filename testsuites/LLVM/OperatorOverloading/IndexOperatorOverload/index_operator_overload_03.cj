// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// bnf测试，错误的操作符函数
class A{
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    operator fun [](x: This, index: Int64, value: Int64): Unit{ // EXPECTED: regex modifier is not allowed here
        x.b = value
    }

}

func main(): Int64{
    var a = A(2)
    return 0
}