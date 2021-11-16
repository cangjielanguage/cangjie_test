// DEPENDENCE: 310.cj 310.cfg
// EXEC: %compiler %cmp_opt -c 310.cj -o 310.%middle
// ERRCHECK: %compiler %cmp_opt  %f 310.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import test310.*

class A<T>{}

func main(): Int64 {
func x(a:Int64):A<test310.I<Int64>>{A<test310.X<Int64>>()} // EXPECTED: regex type of function body is incompatible with return type
var i : Int64 = 10
var myArray : ArrayList<A<test310.I<Int64>>> = ArrayList<A<test310.I<Int64>>>(i,x)
return 0
}
