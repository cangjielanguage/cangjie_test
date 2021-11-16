// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}


class B{
    B(input:Int64)
    {
        func foo(a!:Int64=try{1}finally{}){}
    }
}

func main(){
    B(1)
    return 0
}