// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 4个/1个入参
class A {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    operator func []( index: Int64, value: Int64, value2: Int64): Unit{ // EXPECTED: regex invalid number of parameters for operator '\[\]'
        this.b = value
    }
    operator func [](): Unit{ // EXPECTED: regex invalid number of parameters for operator '\[\]'
        this.b = value
    }
}

func main(): Int64{
    var a = A(2)
    return 0
}