// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Map<Int32,Int64>>{}
class B<X> <: A<X>{}
class C <: A<Map<Int32,Int64>>{}
func main(){
var i : A<Map<Int32,Int64>> = B<Map<Int32,Int64>>()
var j : A<Map<Int32,Int64>> = C()
var k : A2
return 0
}