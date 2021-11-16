// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: regex init
// ASSERT: regex default.*b
// ASSERT: scan exception_try_30009.cj:14
// ASSERT: scan-not exception_try_30009.cj:15
class A <: Exception{}

func a():Int64{throw A()}
func b():Int64{a()}

func main(){
    b()
    a()
    return 0
}