// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}


func main(){
    if (try{true}finally{}) {}
    return 0
}