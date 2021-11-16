// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex init
// ASSERT: scan exception_try_40009.cj:8
class A <: Exception{}

class B{
    init(input!:Int64 = try{throw A()}
        //catch (_) {}
        finally{}
    ){

    }
}

func main(){
    B()
    return 0
}