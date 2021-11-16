// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var base: Int32 = 2

}

class Data<T> <: Base<Int32> {
    var f:T
    init(input:T){
        f = input
    }
}

func main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>(i1)
    var res: Int32 = data.f
    if(res == 3){
        return 0
    }
    return 1
}