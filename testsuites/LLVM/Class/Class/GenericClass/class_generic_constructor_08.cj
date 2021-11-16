// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var a: T
    init(x: T){
        a = x
    }
}

class Data<T> <: Base<Int32> {
    var f: T
    init(f: T){
        super(0)
        this.f = f
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    var res: Int64 = data.f
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}