// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_30004.cj:8
class A <: Exception{}
class B <: Exception{}
func main(){
    try{throw B()}
    finally{}
    return 0
}