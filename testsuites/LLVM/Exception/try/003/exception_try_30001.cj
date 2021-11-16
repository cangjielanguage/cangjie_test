// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_30001.cj:10
class A <: Exception{}
class B <: Exception{}
func main(){
    try{throw B()}
    catch (_) {}
    finally{throw A()}
    return 0
}