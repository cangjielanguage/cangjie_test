// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var b: Int32 = 4
    init(x: T){}
}

class Data<T> <: Base<T> {
    var a: Int32 = 2
    init(x:T){ super(x) }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    if (data.a == 2 && data.b == 4){
        return 0
    }
    return 1
}
