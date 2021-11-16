// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Float16 = 1023.22
    let b: Float16 = 1023.21

    if (a >= b) {
        return 0
    }

    return 1
}