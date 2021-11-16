// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 = Data()
    var obj2 = Data2()
    var res1 : Int32 = obj1.getFoo()
    var res2 : Int32 = obj2.getFoo()

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    open protected func foo(): Int32 {
        return 3
    }
}

class Data <: Base {
    override func foo(): Int32 {
        return 4
    }

    open public func getFoo(): Int32 {
        return foo()
    }
}

class Data2 <: Base {
    open public func getFoo(): Int32 {
        return foo()
    }
}
