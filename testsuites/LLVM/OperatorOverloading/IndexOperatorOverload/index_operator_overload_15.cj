// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 类型匹配
class A{
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    public operator func []( index: Int64, value: Int64): Unit{
        this.b = value
    }
}

func main(): Int64{
    var index: Int32  = 2
    var a = A(2)
    a[index] = 4 // EXPECTED: regex invalid subscript operator \[\] on type 'Class-A' and 'Int32'
    return 0
}