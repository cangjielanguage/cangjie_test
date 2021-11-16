// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    do {
        if (true) {
            return 0
        }
        return 1
    } while (true)
    return 1
}
