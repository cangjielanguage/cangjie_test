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
    var i: Int32 = 3
    override func foo(): Int32{
        return 4
    }
    var i1 : Int32
    var i2 : Int32
    Test() {
        i1 = super.i
        i2 = super.foo() // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
}

class Data<T> <: Base<T> {
    var i: Int32 = 3
    override func foo(): Int32{
        return 4
    }
    var i1 : Int32
    var i2 : Int32
    Data() {
        i1 = super.i + 1
        i2 = super.foo() + 1 // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i1
    var res2: Int32 = test.i2
    var res3: Int32 = data.i1
    var res4: Int32 = data.i2
    if(res1 == 2 && res2 == 3 && res3 == 3 && res4 == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
