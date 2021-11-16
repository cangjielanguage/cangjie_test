// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum I<T>{ i(Int64) }
interface A<X>{}
interface A2 <: A<I<Int32>>{}
class B<X> <: A<X>{}
class C <: A<I<Int32>>{}
func main(){
var i : A<I<Int32>> = B<I<Int32>>()
var j : A<I<Int32>> = C()
var k : A2
return 0
}