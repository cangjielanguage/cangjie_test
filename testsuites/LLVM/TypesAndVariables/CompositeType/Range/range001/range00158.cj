// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = 1
    let b = 10
    let c = a..b:a
    return 0
}
