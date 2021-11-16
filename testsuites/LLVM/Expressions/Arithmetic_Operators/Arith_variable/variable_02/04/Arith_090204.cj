// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = 2147483647
    let b = a / 5

    if (b != 429496729) {
        return 1
    }

    return 0
}