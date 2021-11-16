// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base_i: Int32 = 2
    open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32 = 0
    override func foo(): Int32{
        super.base_i = 3
        var i = super.base_i
        return i
    }
}

class Data<T> <: Base<T> {
    override func foo(): Int32{
        super.base_i = 1
        var i = super.base_i
        return i
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.foo()
    var res2: Int32 = data.foo()
    if(res1 == 3 && res2 == 1){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
