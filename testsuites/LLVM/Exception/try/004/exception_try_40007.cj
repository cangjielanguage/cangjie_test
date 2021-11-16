// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init|test|main
// ASSERT: scan exception_try_40007.cj:9)
class A <: Exception{}

class B{
    func test(){
    try{throw A()}
    finally{}
    }
}

func main(){
    B().test()
    return 0
}