// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// bnf测试，操作符函数为泛型函数
class A {
    var a: Int64
    var b: Int64
    init(x: Int64) {
        a = x
        b = x
    }
    operator func []<T> index: Int64): Int64 { // EXPECTED: regex expected function parameters after function name
        if (index > 1) {
            3
        } else {
            x.a
        }
    }
}

func main(): Int64 {
    var a = A(2)
    return 0
}
