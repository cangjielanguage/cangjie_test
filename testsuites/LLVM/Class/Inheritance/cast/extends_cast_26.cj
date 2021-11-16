// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 : Base = Data()
    var res1 : Int32 = obj1.foo()
    if (res1 != 3) {
        return 1
    }
    return 0
}

open class Base {
    func foo(): Int32 {
        return 3
    }
}

class Data <: Base {
}
