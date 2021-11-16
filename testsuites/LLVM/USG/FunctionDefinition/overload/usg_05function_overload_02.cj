// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func f<X>(a: X): Unit where X <: Object {
}

func f<X>(a: X): Unit {
}

func main() {
    f<Int64>(0)
    f<Float64>(0.0)
    return 0
}

