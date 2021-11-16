// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_70059.cj:9)
class A <: Exception{}

var a = 1

func test():Unit{throw {a++;A()}()}

func main(){
    test()
    return 0
}