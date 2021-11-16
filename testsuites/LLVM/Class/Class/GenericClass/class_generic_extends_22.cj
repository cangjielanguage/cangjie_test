// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base<T> {
    var a: Int32 = 2
}

class Data<T> <: Base<T> {
    static var b : Int32 = 3
}

func main(): Int64 {
    var base: Base<Int32> = Base<Int32>()
    var res: Int32 = Data<Int32>.b
    if(res == 3){
        return 0
    }
    return 1
}
