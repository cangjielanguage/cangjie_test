// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_70026.cj:10
class A <: Exception{}


record B {
    init(){
    throw A()
    }
}

func main(){
    B()
    return 0
}