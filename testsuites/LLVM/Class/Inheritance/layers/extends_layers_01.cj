// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base3 {
    var test : Int32 = 1
}

open class Base2 <: Base3 {
    var test1 : Int32
    init() {
        test1 = test + 1
    }
}

class Data <: Base2 {
    var one : Int32
    init() {
        one = test + test1
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if (res != 3) {
        return 1
    }
    return 0
}