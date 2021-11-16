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
    var i: Int32
    init(x: Int32){
        i = x
    }
    override func foo(): Int32{
        this(super.i)       // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}

class Data<T> <: Base<T> {
    var i: Int32
    init(x: Int32){
        i = x + 1
    }
    override func foo(): Int32{
        this(super.i)       // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    return 0
}

func main(): Int64 {
    return run()
}
