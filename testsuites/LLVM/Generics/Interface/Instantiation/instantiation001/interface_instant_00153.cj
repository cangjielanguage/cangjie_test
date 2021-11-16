// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{}
interface A2 <: A<Range<Int64>>{}
class B<X> <: A<X>{}
class C <: A<Range<Int64>>{}
func main(){
var i : A<Range<Int64>> = B<Range<Int64>>()
var j : A<Range<Int64>> = C()
var k : A2
return 0
}