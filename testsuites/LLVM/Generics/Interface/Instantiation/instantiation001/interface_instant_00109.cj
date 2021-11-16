// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X,T>{}

class B<X,Y> <: A<X,T>{} // EXPECTED: regex undeclared type name 'T'

func main(){
var i : A<Int32,Int64>
B<Int64,Int32>()
return 0
}
