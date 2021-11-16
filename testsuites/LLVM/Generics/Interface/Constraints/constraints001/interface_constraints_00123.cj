// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{}
interface I<X>
where X<:A.B{} // EXPECTED: regex undeclared type name 'B'
func main(){return 0}
