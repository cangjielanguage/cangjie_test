// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64{
    let a = Array<Bool>(5,1 > 1)
    return 0
}
