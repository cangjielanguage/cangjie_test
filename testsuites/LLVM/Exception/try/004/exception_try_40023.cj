// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex -
// ASSERT: scan exception_try_40023.cj:9)
class A <: Exception{}


record B {
    operator func -() {try{throw A()}finally{}}
}

func main(){
    -B()
    return 0
}