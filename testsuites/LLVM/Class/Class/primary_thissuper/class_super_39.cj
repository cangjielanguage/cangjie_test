// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Base<T> {
    var i: Int32 = 2
    open func foo(x: Int32): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    Test(){
        i=foo(super.i)  // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    override func foo(x: Int32): Int32{
        return 3+x
    }
}

class Data<T> <: Base<T> {
    var i: Int32
    Data(){
        i=foo(super.i)  // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    override func foo(x: Int32): Int32{
        return 4+x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if(res1 == 5 && res2 == 6){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
