// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A <: Exception{}

class B <: A{}

func main(){
    try{throw A()}
    catch (a:A|B) {return 0}
    finally{}
    return 1
}