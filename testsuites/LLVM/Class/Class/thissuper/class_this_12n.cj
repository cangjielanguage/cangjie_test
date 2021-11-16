// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    static var i: Int32 = 2
    static func foo(): Int32{
        return 3
    }
    init(){}
    init(a: Int32){
        init()
        this.i          // EXPECTED: regex object cannot access static member 'i'
        this.foo()     // EXPECTED: regex object cannot access static member 'foo'
    }
}

class Data<T> {
    static var i: Int32 = 2
    static func foo(): Int32{
        return 3
    }
    init(){}
    init(a: T){
        init()
        this.i          // EXPECTED: regex object cannot access static member 'i'
        this.foo()      // EXPECTED: regex object cannot access static member 'foo'
    }

}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(2)
    return 0
}

func main(): Int64 {
    return run()
}
