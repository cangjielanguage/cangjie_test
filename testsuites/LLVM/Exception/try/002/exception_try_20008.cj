// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-1: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    throw A()
    return 0
}