// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<String>{}
class B<X> <: A<X>{}
class C <: A<String>{}
func main(){
var i : A<String> = B<String>()
var j : A<String> = C()
var k : A2
return 0
}