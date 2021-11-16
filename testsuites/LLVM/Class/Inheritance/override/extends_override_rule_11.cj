// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var obj1 = Data()
    var obj2 = Base()
    var res1 : Moon = obj1.foo(1)
    var res2 : Sun = obj2.foo(1)

    if (res1.a != 4 || res2.a != 3) {
        return 1
    }
    return 0
}

open class Base {
    open func foo(parm1: Int32): Sun {
        var obj = Sun()
        obj.a = parm1 + 2
        return obj
    }
}

class Data <: Base {
    override func foo(parm1: Int32): Moon {
        var obj = Moon()
        obj.a = parm1 + 3
        return obj
    }
}

open class Sun {
    var a: Int32 = 2
}

class Moon <: Sun {
}
