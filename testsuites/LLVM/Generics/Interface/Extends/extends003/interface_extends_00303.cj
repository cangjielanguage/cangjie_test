// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{}

interface C<X> <: A & A{} // EXPECTED: regex interface 'C' inherits or implements duplicate interface 'A'

func main(){
var a : C<Int32>
return 0
}
