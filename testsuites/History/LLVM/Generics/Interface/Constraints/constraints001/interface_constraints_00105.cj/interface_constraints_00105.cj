// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
interface I<T> where A<:update {}// EXPECTED: regex generics type variable 'A' has not defined
func main(){return 0}
