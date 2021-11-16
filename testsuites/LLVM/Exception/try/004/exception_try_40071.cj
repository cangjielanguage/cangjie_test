// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}


func main(){
    "${func test(){try{0}finally{}};test()}"
    return 0
}