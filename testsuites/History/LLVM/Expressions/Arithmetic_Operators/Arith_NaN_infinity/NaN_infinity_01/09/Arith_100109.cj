// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = 1.2/infinity
    let b = -1.2/-infinity
    let c = -1.2/infinity
    let d = 1.2/-infinity


    if (a != 0.0) {
        return 1
    }
    if (b != 0.0) {
        return 1
    }
    if (c != -0.0) {
        return 1
    }
    if (d != -0.0) {
        return 1
    }

    return 0
}