// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<T>{}

class B<X,T> <: A<T>{}

func main(){
var i : A<Int32>
B<Int64,Int32>()
return 0
}