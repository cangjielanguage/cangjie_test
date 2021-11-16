// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_60001.cj:9)
class A<T> <: Exception{}


func main(){
    try { throw A<Int64>()} finally{}
    return 0
}