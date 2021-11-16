// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Int16>{}
class B<X> <: A<X>{}
class C <: A<Int16>{}
func main(){
var i : A<Int16> = B<Int16>()
var j : A<Int16> = C()
var k : A2
return 0
}