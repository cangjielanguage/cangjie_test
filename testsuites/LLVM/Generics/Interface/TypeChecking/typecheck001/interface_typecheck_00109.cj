// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


class A{}

interface I<T> where T<:A {}

class B <: I<A>{}

func main(){
var i : I<A> = B()
return 0
}
