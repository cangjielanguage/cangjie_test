// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_60003.cj:8)
class A<T> <: Exception{}

func test(){
    try { throw A<Int64>()} catch (_:A<Int32>) {}finally{}
}

func main(){
    test()
    return 0
}