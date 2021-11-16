// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex lambda.0
// ASSERT: scan throwable_30006.cj:5
var test = {func foo(){throw Throwable()};foo()}

func main() {
    test()
    return 5
}
