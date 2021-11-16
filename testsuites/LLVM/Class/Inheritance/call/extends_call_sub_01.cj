// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {}

class Data <: Base {
    var one : Int32 = 1
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if (res != 1) {
        return 1
    }
    return 0
}