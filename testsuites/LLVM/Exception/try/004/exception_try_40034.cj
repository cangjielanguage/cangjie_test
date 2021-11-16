// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex at _GLOBAL.user#main|main
// ASSERT: scan exception_try_40034.cj:8
class A <: Exception{}

func main(){
    var a = "${try{throw A()}finally{};1}"
    return 0
}