// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = 0..10:1
    let b = 0..-10:1
    return 0
}
