// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<UInt16>{}
class B<X> <: A<X>{}
class C <: A<UInt16>{}
func main(){
var i : A<UInt16> = B<UInt16>()
var j : A<UInt16> = C()
var k : A2
return 0
}