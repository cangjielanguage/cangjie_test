// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = NaN + 2.0
    let b = NaN - 2.0
    let c = NaN * 2.0
    let d = NaN / 2.0
    let e = NaN % 2.0
    let f = NaN ** 2.0

    if (a != NaN) {
        return 1
    }
    if (b != NaN) {
        return 1
    }
    if (c != NaN) {
        return 1
    }
    if (d != NaN) {
        return 1
    }
    if (e != NaN) {
        return 1
    }
    if (f != NaN) {
        return 1
    }

    return 0
}