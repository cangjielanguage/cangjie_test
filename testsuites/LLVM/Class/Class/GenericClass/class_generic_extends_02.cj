// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base<T> {
    var b: Int32 = 4
}

class Data <: Base<Int32> {
    var a: Int32 = 2
}

func main(): Int64 {
    var data: Data = Data()
    if (data.a == 2 && data.b == 4){
        return 0
    }
    return 1
}
