// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64{
    let a : Int64 = 1
    let b = Array<Int32>(a,5)
    return 0
}
