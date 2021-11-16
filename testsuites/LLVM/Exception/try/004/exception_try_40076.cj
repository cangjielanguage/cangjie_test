// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex at _GLOBAL.user#main|main
// ASSERT: scan exception_try_40076.cj:9)
class A <: Exception{}


func main(){
    if (try{throw A()}finally{}) {}
    return 0
}