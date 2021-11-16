// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 : Base = Data()
    var res1 : Int32 = obj1.para
    if (res1 != 2) {
        return 1
    }

    return 0
}

open class Base {
    var para : Int32 = 2
}

class Data <: Base {
}
