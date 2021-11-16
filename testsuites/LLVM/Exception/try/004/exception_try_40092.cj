// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// ASSERT: scan exception_try_40092.cj:11)
class A <: Exception{}


func main(){
    try {

    } finally{try {throw A()} finally{}}
    return 0
}