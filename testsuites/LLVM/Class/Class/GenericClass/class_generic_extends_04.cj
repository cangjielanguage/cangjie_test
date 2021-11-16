// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    var b: Int32 = 4
}

class Data<T> <: Base {
    var count: T
    init(x: T){
        count = x
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(2)
    if (data.count == 2 && data.b == 4){
        return 0
    }
    return 1
}
