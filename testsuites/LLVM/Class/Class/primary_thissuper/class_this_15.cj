// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var base: Int32 = 1
}


class Test <: Base {
    var i: Int32 = 2
    func foo(x: Int32): String{
        i = this.base + x
        return i.toString()
    }
}

class Data<T> <: Base {
    var i: T
    Data(x: T){
         i = x
    }
    func foo(x: Int32): Unit {
        this.base = x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(1)
    data.foo(4)
    var res1: String = test.foo(3)
    var res2: Int32 = data.base
    if (res1 == "4" && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
