// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
func g<T>()Where T<:update {} // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition
func main(){return 0}
