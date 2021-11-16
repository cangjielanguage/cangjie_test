// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var one : Int32 = 1
}

class Data <: Base {
    var res : Int32
    init() {
        res = one
    }
}

func main(): Int64 {
    var obj = Data()
    if (obj.res != 1) {
        return 1
    }
    return 0
}