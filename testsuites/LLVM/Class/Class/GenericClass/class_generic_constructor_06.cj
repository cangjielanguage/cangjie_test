// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var a: T
    init(x: T){
        a = x
    }
}

class Data<T> <: Base<T> {
    var f: T
    var g: T
    init(input: T){
        super(input)
        f = input
        g = super.a
    }
}

func run(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    var res1: Int32 = data.f
    var res2: Int32 = data.g
    if (res1 == 4 && res2 == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}