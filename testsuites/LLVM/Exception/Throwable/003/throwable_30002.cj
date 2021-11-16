// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" java.lang.Throwable|An exception has already occurred

func test(a!:Int64= if (true){throw Throwable();0} else{1}){}

func main() {
    test()
    return 0
}
