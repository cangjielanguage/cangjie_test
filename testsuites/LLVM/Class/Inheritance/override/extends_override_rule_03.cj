// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 = Data()
    var obj2 = Base()
    var res1 : Int32 = obj1.foo(2)
    var res2 : Int32 = obj2.foo(2)

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    open func foo(parm1: Int32): Int32 {
        let ret = parm1 + 1
        return ret
    }
}

class Data <: Base {
    override func foo(parm1: Int32): Int32 {
        let ret = parm1 + 2
        return ret
    }
}
