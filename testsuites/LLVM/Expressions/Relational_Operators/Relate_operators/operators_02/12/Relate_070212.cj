// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a = 12
    let b = 10
    let c = true

    (b != a) != false
    (b != b) != c

    return 0
}
