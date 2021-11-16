// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external class Base {
    open func f() { return 1 }
}

external open class parent1 <: Base {
    public override func f() { return 2 }
}

func main(): Int64 {

    var obj:parent1 = parent1()
    if (obj.f() != 2) {
        return 1
    }

    return 0
}
