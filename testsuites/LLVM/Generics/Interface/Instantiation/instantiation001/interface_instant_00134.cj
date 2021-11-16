// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
class B<X> <: A<X>{}
func main(){
var i : A<Int32> = B<Int32>()
return 0
}