// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var i: Int32

    Base(){
        foo() // EXPECTED : regex 'foo' is not allowed to be accessed before all member variables are initialized
    }

    open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    init(){
        foo() // EXPECTED : regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    init(x: Int32){
        i = x
    }

    override func foo(): Int32{
        return 4
    }
}


func main(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.i
    print(res1.toString())
    return Int64(res1 - 2)
}
