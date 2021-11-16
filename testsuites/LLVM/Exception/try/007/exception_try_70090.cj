// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_70090.cj:10
class A <: Exception{}


func main(){
    try {
        try {throw A()} finally{}
    } finally{}
    return 0
}