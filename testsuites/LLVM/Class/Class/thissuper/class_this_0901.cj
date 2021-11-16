// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    func foo(x: Int32): Int32{
        return x + 2
    }
}

class Data<T> <: Base {
    var a: Int32 = 0
    init(){}
    init(x: T){
        this()
        a = this.foo(3)
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(3)
    var res3: Int32 = data.a
    if (res3 == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
