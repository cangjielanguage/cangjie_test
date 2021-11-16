// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40093.cj:10)
class A <: Exception{}
class B <: Exception{}

func main(){
    try {throw A()}
    catch (_) {try {throw B()} catch (a:A){}finally{}}
    finally{}
    return 0
}