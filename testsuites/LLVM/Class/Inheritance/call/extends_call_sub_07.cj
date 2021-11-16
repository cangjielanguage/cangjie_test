// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

open class Base {}

class Data <: Base {
    static var one : Int32 = 1
}

func main(): Int64 {
    var res : Int32 = Data.one
    if (res != 1) {
        return 1
    }
    return 0
}