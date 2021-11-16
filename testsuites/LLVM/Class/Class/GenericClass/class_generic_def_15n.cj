// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T>
    where T <: Int32 {
    var x: T
    init(a: T){
        x = a
    }
}

func main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    return 0
}