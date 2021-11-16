// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" java.lang.Throwable|An exception has already occurred
// ASSERT: scan throwable_30001.cj:5
var a = if (true){throw Throwable();0} else{1}

func main() {
    return 5 // throw before main.
}
