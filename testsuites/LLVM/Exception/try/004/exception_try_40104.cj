// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main

class A <: Exception{}

func main(){
    try {throw try {throw A();A()}finally{}}
    finally {}
    return 0
}