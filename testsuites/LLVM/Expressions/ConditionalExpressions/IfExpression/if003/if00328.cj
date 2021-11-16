// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var test:Int32 = 1
    if (true) {
        test++
        return 0
    }
    return 1
}
