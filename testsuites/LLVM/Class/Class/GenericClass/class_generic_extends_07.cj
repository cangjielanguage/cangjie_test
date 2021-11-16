// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base: Int32 = 4
}

class Data<T> <: Base<Int32> {
    var a: Int32 = 2
    init(x: T){}
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res1: Int32 = data.a
    var res2: Int32 = data.base
    if(res1 == 2 && res2 == 4){
        return 0
    }
    return 1
}