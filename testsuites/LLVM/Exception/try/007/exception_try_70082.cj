// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_70082.cj:7
class A <: Exception{}

func test():Unit{throw {match (1){case _ => 1};A()}()}

func main(){
    test()
    return 0
}