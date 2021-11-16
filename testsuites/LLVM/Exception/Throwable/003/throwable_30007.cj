// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main

var test = {var foo = {throw Throwable()};foo()}

func main() {
    test()
    return 5
}
