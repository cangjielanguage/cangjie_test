// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface A<X,Y>{}
class B<X,Y,Z> <: A<X &Y>{}
class C <: A<Int32 &Int32>{}
func main(){
var i : A<Int32,Int32> = B<Int64,Int64,Int64>() // EXPECTED: regex no matching constructor for call 'B'
var j : A<Int64,Int64> = C() // EXPECTED: regex no matching constructor for call 'C'
return 0
}
