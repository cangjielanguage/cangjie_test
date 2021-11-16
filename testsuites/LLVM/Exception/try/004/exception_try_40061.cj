// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func test(a:Int64){}

func main(){
    test(try{1}finally{})
    return 0
}