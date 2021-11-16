// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = 1.2/0

    if (a != infinity) {
        return 1
    }

    return 0
}