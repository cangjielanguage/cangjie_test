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
    var g: Int32
    init(input: T){
        f = input
        g = this.getNum<Int32>(3)
    }
    func getNum<V>(x: V): V{
        return x
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    var res1: Int64 = data.f
    var res2: Int32 = data.g
    if (res1 == 4 && res2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}