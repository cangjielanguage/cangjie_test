// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base3 {
    static func foo() : Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    redef static func foo() : Int32 {
        return 2
    }
}

class Data <: Base2 {
    redef static func foo() : Int32 {
        return 1
    }
}

func main(): Int64 {
    var res : Int32 = Data.foo()
    if (res != 1) {
        return 1
    }
    return 0
}
