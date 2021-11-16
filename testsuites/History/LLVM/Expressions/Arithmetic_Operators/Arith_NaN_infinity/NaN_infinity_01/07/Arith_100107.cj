// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = infinity - infinity
    let b = infinity / infinity

    if (a != NaN) {
        return 1
    }
    if (b != NaN) {
        return 1
    }

    return 0
}