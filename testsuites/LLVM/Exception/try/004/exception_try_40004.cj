// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

interface B{
    static func foo(){
    try{throw A()}
    catch (_) {}
    finally{}
    }
}

func main(){
    return 0
}