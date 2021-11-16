// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test

func test(){throw Throwable()}

func main() {
    test()
    return 5
}
