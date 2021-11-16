// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
class B <: A<Int32>{}
func main(){
var i : A<Int32> = B()
return 0
}