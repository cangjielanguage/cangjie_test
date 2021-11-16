// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    if (true) {
        var test : Int64 = 0
        return test
    }
    return 1
}
