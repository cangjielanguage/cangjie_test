// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

class B{
    operator func !(){
    try{throw A()}
    catch (_) {}
    finally{}
    }
}

func main(){
    !B()
    return 0
}