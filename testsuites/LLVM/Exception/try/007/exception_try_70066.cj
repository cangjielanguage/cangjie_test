// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex lambda.0
// ASSERT: scan exception_try_70066.cj:7
class A <: Exception{}

var a : ()->A = {throw A()}

func main(){
    a()
    return 0
}