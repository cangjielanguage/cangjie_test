// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_try_40068.cj:8
class A <: Exception{}


func main(){
    var f = spawn{try {throw A()} finally{}}
    f.getResult().getOrThrow()
    return 0
}