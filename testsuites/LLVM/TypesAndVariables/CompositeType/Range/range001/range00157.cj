// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let arrayRange = @{1}[0]..@{10}[0]:@{1}[0]
    return 0
}
