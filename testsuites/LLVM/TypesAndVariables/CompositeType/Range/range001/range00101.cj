// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a = 0..10:1
    a = 0..5
    return 0
}
