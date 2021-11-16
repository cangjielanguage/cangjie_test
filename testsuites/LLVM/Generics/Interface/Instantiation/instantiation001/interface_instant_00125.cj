// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}

interface B<X,Y,Z> <: A<X> &A<Y>{}

func main(){
var i : A<Int32>
var j : B<Int32,Int64,Int8>
return 0
}