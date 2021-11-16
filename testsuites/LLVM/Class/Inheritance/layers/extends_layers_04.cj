// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base3 {
    open func foo3() : Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    override open func foo3() : Int32 {
        return 2
    }
}

class Data <: Base2 {
    override func foo3() : Int32 {
        return 1
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.foo3()
    if (res != 1) {
        return 1
    }
    return 0
}