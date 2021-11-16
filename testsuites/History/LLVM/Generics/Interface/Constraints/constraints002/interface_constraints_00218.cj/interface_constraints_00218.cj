// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait A{}
trait B{}
trait C{}

interface I<X,Y,Z> where X<:A, Y<:B, Z<:C {}

func main(){
    return 0
}
