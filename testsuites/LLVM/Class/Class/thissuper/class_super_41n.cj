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
    override func foo(){
        var super.i = 3    // EXPECTED: regex 'super' is keyword not identifier
        return super.i
    }
}

class Data<T> <: Base<T> {
    override func foo(){
        var super.i = 1    // EXPECTED: regex 'super' is keyword not identifier
        return super.i
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
