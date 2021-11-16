// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<(Unit)->Unit>{}
class B<X> <: A<X>{}
class C <: A<(Unit)->Unit>{}
func main(){
var i : A<(Unit)->Unit> = B<(Unit)->Unit>()
var j : A<(Unit)->Unit> = C()
var k : A2
return 0
}