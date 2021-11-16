// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test() {
    return
}
func main(): Int64 {
    while (test()) {  // EXPECTED: regex no matching function declaration for function call 'test'
        return 0
    }
    return 1
}
