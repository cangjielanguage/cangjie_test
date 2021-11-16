// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_70100.cj:8

class A <: Exception{}

func test():Unit{throw {do {}while (false);A()}()}

func main(){
    test()
    return 0
}