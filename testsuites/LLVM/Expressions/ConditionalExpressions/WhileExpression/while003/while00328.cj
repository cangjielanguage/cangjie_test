// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    while (true) {
        while (false) {
            return 0
        }
        return 0
    }
    return 1
}
