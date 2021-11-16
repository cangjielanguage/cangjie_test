// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40080.cj:9)
class A <: Exception{}


func main(){
    Int64(try{throw A();1}finally{})
    return 0
}