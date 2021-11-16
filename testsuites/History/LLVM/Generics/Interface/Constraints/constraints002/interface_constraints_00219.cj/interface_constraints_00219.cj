// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait A{}
trait B{}
trait C{}

interface I<A,B,C> where A<:A, B<:B, C<:C {}

func main(){
    return 0
}
