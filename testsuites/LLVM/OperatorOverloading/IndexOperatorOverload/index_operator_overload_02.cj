// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// bnf测试  static修饰/缺少operator修饰符
class A{
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    static operator func []( index: Int64, value: Int64): Unit{  // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
        x.b = value
    }
    func []( index: Int64): Int64{ // EXPECTED: regex expected function name after 'func'
        if (index > 1) {
            3
        } else {
            x.a
        }
    }
}

func main(): Int64{
    var a = A(2)
    return 0
}