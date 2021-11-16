// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class I{}
interface A<X>{}
interface A2 <: A<I>{}
class B<X> <: A<X>{}
class C <: A<I>{}
func main(){
var i : A<I> = B<I>()
var j : A<I> = C()
var k : A2
return 0
}