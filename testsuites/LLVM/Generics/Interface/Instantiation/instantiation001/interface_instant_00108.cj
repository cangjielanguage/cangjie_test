// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X,T>{}

class B<X,T> <: A<X,T>{}

func main(){
var i : A<Int32,Int64>
B<Int64,Int32>()
return 0
}