// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var i: Int32 = 2
    open func foo(): Int32{
        return 3
    }
}

open class Middle<T> <: Base<T>{}

class Test <: Middle<Int32>{
    var i: Int32
    Test(){
        i = super.foo() + 1 // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    override func foo(): Int32{
        return 4
    }
}

class Data<T> <: Middle<T> {
    var i: Int32
    Data(){
        i = super.foo() + 2 // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    override func foo(): Int32{
        return 4
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if(res1 == 4 && res2 == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
