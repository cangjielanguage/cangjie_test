// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    for (i in -10..10:-1) {
        return 1
    }
    return 0
}
