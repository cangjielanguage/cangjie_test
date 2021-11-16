// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}

interface B <: A<Int32>{}

func main(){
var i : A<Int32>
var j : B
return 0
}