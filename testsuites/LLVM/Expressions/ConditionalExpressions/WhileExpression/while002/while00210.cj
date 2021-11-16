// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Bool {
    return true
}
func main(): Int64 {
    while (test()) {
        return 0
    }
    return 1
}
