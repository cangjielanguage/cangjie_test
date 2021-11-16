// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_60002.cj:8)
class A<T> <: Exception{}

func test<T>(){
    try { throw A<T>()} finally{}
}

func main(){
    test<Int64>()
    return 0
}