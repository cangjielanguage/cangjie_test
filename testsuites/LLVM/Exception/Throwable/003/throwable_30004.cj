// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex lambda.0
// ASSERT: scan throwable_30004.cj:5
var test = {throw Throwable()}

func main() {
    test()
    return 5
}
