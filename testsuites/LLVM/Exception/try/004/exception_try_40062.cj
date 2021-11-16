// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40062.cj:10
class A <: Exception{}

func test(a:Int64){}

func main(){
    test(try{throw A();1}finally{})
    return 0
}