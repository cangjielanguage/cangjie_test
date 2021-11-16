// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_30007.cj:7
class A <: Exception{}

func test(){throw A()}

func main(){
    test()
    return 0
}