// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: regex main
// ASSERT: scan exception_try_70092.cj:9)
class A <: Exception{}
class B <: Exception{}

func test():Unit{throw {try { throw A()}finally{};B()}()}

func main(){
    test()
    return 0
}