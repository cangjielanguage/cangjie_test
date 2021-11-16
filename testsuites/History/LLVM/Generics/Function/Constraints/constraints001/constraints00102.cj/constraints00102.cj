// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
func g()where T<:update {} // EXPECTED: regex there should not be 'where' because there are no type parameters
func main(){return 0}
