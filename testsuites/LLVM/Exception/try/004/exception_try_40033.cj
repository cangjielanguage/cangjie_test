// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    var a = "${try{1}finally{}}"
    return 0
}