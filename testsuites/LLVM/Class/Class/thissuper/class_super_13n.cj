// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    class Inner{
        var inner: Int32 = 4
    }
}

class Test <: Base<Int32>{
    init(){
        super.Inner()    // EXPECTED: regex object cannot access static member 'Inner'
    }

}

class Data<T> <: Base<T> {
    init(){
        super.Inner()    // EXPECTED: regex object cannot access static member 'Inner'
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
