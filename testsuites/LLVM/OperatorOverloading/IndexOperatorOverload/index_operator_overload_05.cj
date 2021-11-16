// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// bnf测试，操作符函数为泛型函数
class A<T> {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    operator func [](x: A<T>, index: Int64, value: Int64): Unit where T <: Int64{ // EXPECTED: regex there should not be 'where' because there are no type parameters
        x.b = value
    }
}

func main(): Int64{
    var a = A(2)
    return 0
}