// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test|default.A
// ASSERT: scan exception_try_40011.cj:7
class A <: Exception{}

func test(input!:Int64 = try{throw A()}finally{}) {}

func main(){
    test()
    return 0
}