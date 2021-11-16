// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    static var i: Int32 = 2
    static func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i1 = super.i    // EXPECTED: regex 'super' is not allowed to initialize non-static member
    var i2 = super.foo()    // EXPECTED: regex 'super' is not allowed to initialize non-static member
}

class Data<T> <: Base<T> {
    var i1 = super.i + 1    // EXPECTED: regex 'super' is not allowed to initialize non-static member
    var i2 = super.foo() + 1    // EXPECTED: regex 'super' is not allowed to initialize non-static member
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
