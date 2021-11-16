// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X,Y,Z>{}

class B<X,Y> <: A<X,Y,Z>{} // EXPECTED: regex undeclared type name 'Z'

func main(){
var i : A<Int32,Int64>
B<Int64,Int32>()
return 0
}
