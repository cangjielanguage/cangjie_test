// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}

interface B<X,Y> <: A<X>{}

func main(){
var i : A<Int32>
var j : B<Int64,Int32>
return 0
}