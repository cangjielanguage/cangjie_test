// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<Int32> {
    var a: T
    var f: T
    init(input:T){
        super(0)
        a = input
        f = a
    }
}

func main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>(i1)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if(res1 == 3 && res2 == 3){
        return 0
    }
    return 1
}