// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func main(){
    try {throw A()}
    catch (_) {try {1} catch (a:A){2}finally{}}
    finally{}
    return 0
}