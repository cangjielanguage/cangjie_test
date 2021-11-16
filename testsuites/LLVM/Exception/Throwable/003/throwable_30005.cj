// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex at foo|main
// ASSERT: scan throwable_30005.cj:6

var test = {func foo(a!:Int64= if (true){throw Throwable();0} else{1}){};foo()}

func main() {
    test()
    return 5
}
