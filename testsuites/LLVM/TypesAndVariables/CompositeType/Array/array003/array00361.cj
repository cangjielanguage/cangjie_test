// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64{
    let a = Array<Int32>(5,5)
    let b = Array<Int32>(5,a[0])
    return 0
}
