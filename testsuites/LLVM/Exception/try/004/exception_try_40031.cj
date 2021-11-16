// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    var a : Array<Int64> = @{1}
    a[try{0}finally{}]
    return 0
}