// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Option<Int32>>{}
class B<X> <: A<X>{}
class C <: A<Option<Int32>>{}
func main(){
var i : A<Option<Int32>> = B<Option<Int32>>()
var j : A<Option<Int32>> = C()
var k : A2
return 0
}