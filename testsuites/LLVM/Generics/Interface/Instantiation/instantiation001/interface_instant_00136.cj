// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<UInt8>{}
class B<X> <: A<X>{}
class C <: A<UInt8>{}
func main(){
var i : A<UInt8> = B<UInt8>()
var j : A<UInt8> = C()
var k : A2
return 0
}