// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a = 8
    let b = 10
    let c = true

    (a != b) == c
    (a != a) == false

    return 0
}
