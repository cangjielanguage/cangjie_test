// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a =  128 * 0

    if (a != 0) {
        return 1
    }

    let b = 128.5 * 0.0

    if (b != 0.0) {
        return 1
    }

    return 0
}