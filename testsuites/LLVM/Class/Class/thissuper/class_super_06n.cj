// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var i3: Int32 = 2
    open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    init(){
        i = super.i + 1     // EXPECTED: regex is not a member of class
    }
}

class Data<T> <: Base<T> {
    var i: Int32
    init(){
        i = super.i + 2        // EXPECTED: regex is not a member of class
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if(res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
