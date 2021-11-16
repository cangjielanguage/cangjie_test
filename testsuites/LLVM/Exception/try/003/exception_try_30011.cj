// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Exception{}

func a():Int64{throw A()}
func b():Int64{a()}

func main(){
    try{
    b()
    }catch (_){1}
    return 0
}