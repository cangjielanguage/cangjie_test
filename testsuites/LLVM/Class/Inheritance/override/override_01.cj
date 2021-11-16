// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return 0
}

open class Father {}
class Child <: Father {}


open class C1{
    open func f() {}
    open func f1(): Father{ Father() }
}

interface I{
    func f() {}
}

class C2<: C1 & I{
    override func f (){}
    override func f1 (): Child {Child()}
}
