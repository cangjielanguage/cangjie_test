// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {

    let a: Float16 = 1.6
    let b = a ** 65504.1

    return 0
}