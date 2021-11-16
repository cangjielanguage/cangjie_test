// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var i: Int32 = 2
    open func foo(x: Int32): Int32{
        return x + 1
    }
}

class Test <: Base<Int32>{
    override func foo(x: Int32): Int32{
        return super.i+x
    }
}

class Data<T> <: Base<T> {
    override func foo(x: Int32): Int32{
        return super.i+x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.foo(2)
    var res2: Int32 = data.foo(3)
    if(res1 == 4 && res2 == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
