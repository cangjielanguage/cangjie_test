// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40098.cj:9)

class A <: Exception{}

func main(){
    while (try {throw A()}finally{}) {}
    return 0
}