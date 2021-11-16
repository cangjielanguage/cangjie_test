// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_60005.cj:8)
class A <: Exception{}

func test(){
    try { throw A()} catch (a:A) {
    a.printStackTrace()}finally{}
}

func main(){
    test()
    return 0
}