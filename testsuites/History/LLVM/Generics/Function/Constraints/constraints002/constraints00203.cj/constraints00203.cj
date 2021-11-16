// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait first{}
trait second where This <: first{}
class A{}
append A with second,first{}

func g<T>() where T<:first {}

func main(){
    g<A>()
    return 0
}
