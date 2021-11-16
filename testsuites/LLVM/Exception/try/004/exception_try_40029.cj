// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan exception_try_40029.cj:9)
class A <: Exception{}


func test(){
    try {throw A()} finally{}
}
func main(){
    test()
    return 0
}