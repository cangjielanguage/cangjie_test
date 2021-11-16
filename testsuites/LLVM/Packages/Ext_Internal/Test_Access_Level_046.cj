// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external class Base {
    open func f() { return 1 }
}

external open class child1 <: Base {
    public func f1() { return 2 }
}

external open class child2 <: child1 {
    public override func f() { return 3 }
}

func main(): Int64 {

    var obj:child2 = child2()
    if (obj.f() != 3) {
        return 1
    }

    return 0
}
