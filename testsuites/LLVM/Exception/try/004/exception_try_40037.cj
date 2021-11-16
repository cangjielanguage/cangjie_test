// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func test(a:Int64):Int64{a}

func main(){
    try{test}finally{} ~> test
    return 0
}