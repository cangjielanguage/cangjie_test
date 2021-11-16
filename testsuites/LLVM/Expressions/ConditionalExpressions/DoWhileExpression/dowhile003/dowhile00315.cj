// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    do {
        let sum = { a: Int32, b: Int32 => a + b}
        return 0
    } while (true)
    return 1
}
