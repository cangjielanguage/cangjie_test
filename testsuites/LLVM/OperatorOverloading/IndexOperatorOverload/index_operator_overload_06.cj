// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 返回类型为非unit
class A {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    operator func []( index: Int64, value: Int64): Int64{ // EXPECTED: regex the return type of the value setting '\[\]' must be 'Unit'
        x.b = value
        x.b
    }
}

func main(): Int64{
    var a = A(2)
    return 0
}