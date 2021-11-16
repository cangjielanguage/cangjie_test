// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex _GLOBAL.user#main|main
// ASSERT: scan exception_try_70085.cj:10
class A <: Exception{}


func main(){
    match ("1") {
        case _ => throw A()
    }
    return 0
}