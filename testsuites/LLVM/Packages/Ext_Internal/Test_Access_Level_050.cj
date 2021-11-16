// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external class Base {
    protected open func f() { return 1 }
}

external open class child1 <: Base {
    public func f1() { return 2 }
}

external open class child2 <: child1 {
    protected override func f() { return 3 }
}

func main(): Int64 {

    return 0
}
