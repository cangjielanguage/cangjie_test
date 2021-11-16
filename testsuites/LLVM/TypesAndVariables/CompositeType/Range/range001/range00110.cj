// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = 0..1
    let b = 0..-1
    let c  = 0..0
    return 0
}
