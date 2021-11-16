// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_70034.cj:8)
class A <: Exception{}

func main(){
    var a = "${func test():Int64{throw A()};test()}"
    return 0
}