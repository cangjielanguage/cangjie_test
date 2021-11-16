// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Int32*Int64>{}
class B<X> <: A<X>{}
class C <: A<Int32*Int64>{}
func main(){
var i : A<Int32*Int64> = B<Int32*Int64>()
var j : A<Int32*Int64> = C()
var k : A2
return 0
}