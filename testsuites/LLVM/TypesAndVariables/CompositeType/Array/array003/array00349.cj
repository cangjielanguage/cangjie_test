// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64{
    let a = Array<Range<Int64>>(5,0..10:2)
    return 0
}
