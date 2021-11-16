// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 = Data()
    var obj2 = Base()
    var res1 : Int32 = obj1.getFoo2()
    var res2 : Int32 = obj2.getFoo()

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    private func foo(): Int32 {
        return 3
    }

    func getFoo(): Int32 {
        return foo()
    }
}

class Data <: Base {
    private func foo(): Int32 {
        return 4
    }

    func getFoo2(): Int32 {
        return foo()
    }
}
