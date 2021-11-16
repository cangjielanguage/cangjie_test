// EXEC: %compiler %cmp_opt  %f -o %output
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

func run(): Int64 {
    var value : Data = Data()
    if (value.res != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}