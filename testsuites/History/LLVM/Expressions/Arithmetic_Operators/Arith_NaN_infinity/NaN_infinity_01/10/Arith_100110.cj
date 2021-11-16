// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = 0/infinity
    let b = 0/-infinity

    if (a != 0.0) {
        return 1
    }
    if (b != -0.0) {
        return 1
    }

    return 0
}