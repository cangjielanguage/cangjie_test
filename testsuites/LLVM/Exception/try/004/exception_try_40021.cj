// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init|test|main
// ASSERT: scan exception_try_40021.cj:11
class A <: Exception{}


record B {
    B(input:Int64)
    {
        func test(a!:Int64 = try{throw A()}finally{}) {}
        test()
    }
}

func main(){
    B(1)
    return 0
}