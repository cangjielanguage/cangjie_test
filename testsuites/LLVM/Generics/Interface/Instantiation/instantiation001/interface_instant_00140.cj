// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<UInt32>{}
class B<X> <: A<X>{}
class C <: A<UInt32>{}
func main(){
var i : A<UInt32> = B<UInt32>()
var j : A<UInt32> = C()
var k : A2
return 0
}