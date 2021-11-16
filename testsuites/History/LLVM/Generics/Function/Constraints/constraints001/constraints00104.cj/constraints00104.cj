// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
func g<T>()where X<:update {} // EXPECTED: regex generics type variable 'X' has not defined
func main(){return 0}
