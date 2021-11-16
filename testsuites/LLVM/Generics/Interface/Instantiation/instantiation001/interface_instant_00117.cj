// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}

interface B<Y> <: A<Y>{}

func main(){
var i : A<Int32>
var j : B<Int64>
return 0
}