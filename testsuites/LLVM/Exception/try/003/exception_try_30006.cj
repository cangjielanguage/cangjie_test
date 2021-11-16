// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_30006.cj:11
class A <: Exception{}
class B <: Exception{}
class C <: Exception{}
func main(){
    try{throw A()}
    catch (_) {throw B()}
    finally{throw C()}
    return 0
}