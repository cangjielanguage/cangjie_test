// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_70007.cj:9)
class A <: Exception{}

class B{
    func test():Unit{
    throw A()
    }
}

func main(){
    B().test()
    return 0
}