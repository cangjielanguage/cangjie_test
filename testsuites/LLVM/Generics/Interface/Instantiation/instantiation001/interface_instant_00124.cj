// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X>{}

interface B<X> <: A<X> &A<X>{} // EXPECTED: regex interface 'B' inherits or implements duplicate interface 'A'

func main(){
var i : A<Int32>
return 0
}
