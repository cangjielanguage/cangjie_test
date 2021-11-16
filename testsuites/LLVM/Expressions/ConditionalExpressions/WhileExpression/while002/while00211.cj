// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Bool {
    return false
}
func main(): Int64 {
    while (test()) {
        return 1
    }
    return 0
}
