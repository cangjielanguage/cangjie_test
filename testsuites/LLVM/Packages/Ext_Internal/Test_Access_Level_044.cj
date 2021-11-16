// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external class Base {
    protected open func f() { return 1 }
}

external open class parent1 <: Base {
    protected override func f() { return 2 }
}

func main(): Int64 {

    return 0

}
