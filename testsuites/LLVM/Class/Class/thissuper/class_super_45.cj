// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base_i: Int32 = 2
    open func foo(x: Int32): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32 = 0
    func f(){
        i = foo(super.base_i)
        return i
    }
    override func foo(x: Int32): Int32{
        return 3+x
    }
}

class Data<T> <: Base<T> {
    var i: Int32 = 0
    func f(): Int32 {
        i = foo(super.base_i)
        return i
    }
    override func foo(x: Int32): Int32{
        return 4+x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.f()
    var res2: Int32 = data.f()
    if(res1 == 5 && res2 == 6){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
