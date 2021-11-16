// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Int8>{}
class B<X> <: A<X>{}
class C <: A<Int8>{}
func main(){
var i : A<Int8> = B<Int8>()
var j : A<Int8> = C()
var k : A2
return 0
}