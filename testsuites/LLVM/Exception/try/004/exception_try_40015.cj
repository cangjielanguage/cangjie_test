// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_40015.cj:11
class A <: Exception{}


class B{
    B(input:Int64)
    {
        var a:Int64=try{throw A()}finally{}
    }
}

func main(){
    B(1)
    return 0
}