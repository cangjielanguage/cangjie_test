// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-1: %run %run_opt %output %run_args

class A<:Throwable{}

func main(){
    "${throw A();1}"
    return 0
}