// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(a: Int64): Unit {
}

func f(a: Float64): Unit {
}

func main() {
    f(0)
    f(0.0)
    return 0
}
