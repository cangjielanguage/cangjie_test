// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a = 10
    let b = 20
    let c = 30

    var res = a > {b} ? a: { c > b ? c: b}

    if res != 30 {
        return 1
    }

    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace