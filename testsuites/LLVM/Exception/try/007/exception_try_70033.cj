// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_70033.cj:8
class A <: Exception{}

func main(){
    var a = "${throw A();1}"
    return 0
}