// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    try{1}finally{} * try{1}finally{}
    return 0
}