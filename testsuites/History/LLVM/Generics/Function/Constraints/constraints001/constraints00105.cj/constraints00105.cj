// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
func g<T>()where T<:update {}
func f<X>()where T<:update {} // EXPECTED: regex generics type variable 'T' has not defined
func main(){return 0}
