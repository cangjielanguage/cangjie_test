// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40042.cj:8
class A <: Exception{}

func main(){
    try{throw A();true}finally{} || try{throw A();true}finally{}
    return 0
}