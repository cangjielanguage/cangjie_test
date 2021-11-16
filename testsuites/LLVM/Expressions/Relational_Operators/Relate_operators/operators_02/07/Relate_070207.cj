// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a = 11
    let b = 10
    let c = true
    let d = false

    a < b != c
    b < a != d

    return 0
}
