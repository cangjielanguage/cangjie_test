// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Bool>{}
class B<X> <: A<X>{}
class C <: A<Bool>{}
func main(){
var i : A<Bool> = B<Bool>()
var j : A<Bool> = C()
var k :A2
return 0
}