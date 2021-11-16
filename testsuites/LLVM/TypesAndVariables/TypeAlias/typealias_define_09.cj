// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type float<T> = Float64

func main(): Int64 {
    var data: float<Float16> = 1.0001
    return 0
}