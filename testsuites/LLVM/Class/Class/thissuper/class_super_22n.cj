// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var i: Int32 = 2
    open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    static func f(){
        super.foo()    // EXPECTED: regex  non-static variable 'super' cannot be referenced from a static context
        super.i         // EXPECTED: regex  non-static variable 'super' cannot be referenced from a static context
    }
}

class Data<T> <: Base<T> {
    static func f(){
        super.foo()    // EXPECTED: regex  non-static variable 'super' cannot be referenced from a static context
        super.i         // EXPECTED: regex  non-static variable 'super' cannot be referenced from a static context
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    test.f()
    data.f()
    return 0
}

func main(): Int64 {
    return run()
}
