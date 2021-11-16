// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Float16 = 1023.2
    let b: Float16 = 2047.8

    if (a == b) {
        return 1
    }

    return 0
}

