// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res1 : Int32 = Data.foo()
    var res2 : Int32 = Base.foo()

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    static func foo(): Int32 {
        return 3
    }
}

class Data <: Base {
    redef static func foo(): Int32 {
        return 4
    }
}
