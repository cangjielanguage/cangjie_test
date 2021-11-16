// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 = Data()
    var obj2 = Base()
    var obj3 = Sun()
    var obj4 = Moon()
    var res1 : Int64 = obj1.foo(obj3)
    var res2 : Int64 = obj2.foo(obj4)

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    open func foo(parm1: Moon): Int64 {
        let ret = parm1.getFoo() + 1
        return ret
    }
}

class Data <: Base {
    func foo(parm1: Sun): Int64 {
        let ret = parm1.getFoo() + 2
        return ret
    }
}

open class Sun {
    open func getFoo() {
        return 2
    }
}

class Moon <: Sun {
}
