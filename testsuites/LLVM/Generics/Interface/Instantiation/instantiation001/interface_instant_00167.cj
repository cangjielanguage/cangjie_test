// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Array<Int32>>{}
class B<X> <: A<X>{}
class C <: A<Array<Int32>>{}
func main(){
var i : A<Array<Int32>> = B<Array<Int32>>()
var j : A<Array<Int32>> = C()
var k : A2
return 0
}