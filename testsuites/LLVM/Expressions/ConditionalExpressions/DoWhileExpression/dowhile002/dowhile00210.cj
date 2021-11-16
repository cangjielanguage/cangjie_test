// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Bool {
    return true
}
func main(): Int64 {
    do {
        return 0
    } while (test())
    return 1
}
