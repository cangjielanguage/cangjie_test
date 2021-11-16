// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X,Y>{}

interface B<X,Y> <: A<X,Y>{}

func main(){
var i : A<Int32,Int64>
var j : B<Int64,Int32>
return 0
}