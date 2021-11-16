// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static open func foo(x:Int32):Int32{        // EXPECTED: regex modifiers 'static' and 'open' are conflict in function declaration
        return x
    }
}

class Data <: Base {
    var a: Int32 = Base.foo(2)
}

func run(): Int64 {
    var res1: Int32 = Data().a
    if (res1 != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
