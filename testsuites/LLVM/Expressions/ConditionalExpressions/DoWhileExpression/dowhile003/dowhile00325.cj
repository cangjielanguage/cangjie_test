// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    do {
        Int32(1)
        return 0
    } while (true)
    return 1
}
