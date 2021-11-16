// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
interface A<X>{}
interface A2 <: A<HashMap<Int32,Int64>>{}
class B<X> <: A<X>{}
class C <: A<HashMap<Int32,Int64>>{}
func main(){
var i : A<HashMap<Int32,Int64>> = B<HashMap<Int32,Int64>>()
var j : A<HashMap<Int32,Int64>> = C()
var k : A2
return 0
}