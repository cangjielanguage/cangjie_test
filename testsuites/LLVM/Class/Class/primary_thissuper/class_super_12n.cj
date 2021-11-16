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
    var i1: Int32
    var i2: Int32
    Test(){
        i1 = super.i    // EXPECTED: regex object cannot access static member 'i'
        i2 = super.foo()    // EXPECTED: regex object cannot access static member 'foo'
    }

}

class Data<T> <: Base<T> {
    var i1: Int32
    var i2: Int32
    Data(){
        i1 = super.i + 1    // EXPECTED: regex object cannot access static member 'i'
        i2 = super.foo() + 1    // EXPECTED: regex object cannot access static member 'foo'
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
