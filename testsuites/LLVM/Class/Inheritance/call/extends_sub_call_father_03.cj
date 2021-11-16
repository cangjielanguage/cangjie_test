// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var one : Int32 = 1
}

class Data <: Base {
    var father = Base()
    var res = father.one
}

func main(): Int64 {
    var obj = Data()
    if (obj.res != 1) {
        return 1
    }
    return 0
}