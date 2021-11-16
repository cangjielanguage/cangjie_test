// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_try_30010.cj:7

class A <: Exception{}
func main(){
    try {throw A()} finally{}
    return 5
}