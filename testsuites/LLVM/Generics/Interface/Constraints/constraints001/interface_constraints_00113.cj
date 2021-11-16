// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<X>
where X<:test{} // EXPECTED: regex undeclared type name 'test'
func main(){return 0}
