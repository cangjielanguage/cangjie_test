// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

var a = {try {1} finally{}}

func main(){
    a()
    return 0
}