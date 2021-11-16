// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let myArray = @{@{10,10,10},@{20,20,20}}
    return 0
}
