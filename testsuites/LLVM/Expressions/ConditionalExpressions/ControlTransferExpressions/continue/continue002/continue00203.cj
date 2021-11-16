// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var test : Int32 = 0
    while (test !=10) {
        test++
        continue
    }
    if (test == 10) {
        return 0
    }
    return 10
}
