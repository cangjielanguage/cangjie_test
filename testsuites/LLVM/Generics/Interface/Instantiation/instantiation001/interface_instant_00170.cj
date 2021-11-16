// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<A<Int32>>{}
class B<X> <: A<X>{}
class C <: A<A<Int32>>{}
func main(){
var i : A<A<Int32>> = B<A<Int32>>()
var j : A<A<Int32>> = C()
var k : A2
return 0
}