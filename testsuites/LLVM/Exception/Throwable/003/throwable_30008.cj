// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex lambda.0|lambda.1

var test = {var foo = {throw Throwable()};foo();1}()

func main() {
    return 5
}
