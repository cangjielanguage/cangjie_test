// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<UInt64>{}
class B<X> <: A<X>{}
class C <: A<UInt64>{}
func main(){
var i : A<UInt64> = B<UInt64>()
var j : A<UInt64> = C()
var k : A2
return 0
}