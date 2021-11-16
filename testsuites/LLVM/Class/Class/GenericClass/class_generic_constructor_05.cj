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
    var g: Float32
    init(input: T){
        super(0)
        f = input
        g = 0.0
    }
    init(input: T, i: Float32){
        this(input)
        g = i
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var i2: Float32 = 2.333
    var data: Data<Int64> = Data<Int64>(i1, i2)
    var res1: Int64 = data.f
    var res2: Float32 = data.g
    if (res1 == 4 && res2 == 2.333){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
