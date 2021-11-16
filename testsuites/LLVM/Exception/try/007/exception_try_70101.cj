// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex _GLOBAL.user#main|main
// ASSERT: scan exception_try_70101.cj:9)

class A <: Exception{}

func main(){
    do {throw A()} while (false)
    return 0
}