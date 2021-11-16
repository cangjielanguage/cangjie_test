// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(a: Int64): Unit {
}

func g() {
    func f(a: Float64): Unit {}
    f(1.0)
}


func main():Int64{
    f(1)
    g()
    return 0
}