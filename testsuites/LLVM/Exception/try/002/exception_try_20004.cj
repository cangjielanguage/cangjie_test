// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    try{throw A()}
    catch (a:A) {return 0}
    catch (_) {return 2}
    finally{}
    return 1
}