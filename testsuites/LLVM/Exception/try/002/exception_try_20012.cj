// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A <: Exception{}

class B <: A{}

func main(){
    try{throw A()}
    catch (a:A|A) {return 0}
    finally{}
    return 1
}