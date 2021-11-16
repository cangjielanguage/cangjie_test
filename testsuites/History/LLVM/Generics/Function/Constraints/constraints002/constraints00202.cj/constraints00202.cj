// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
class A{}
func g<T>()where T<:update {}
func main(){
g<A>(A()) // EXPECTED: regex no matching function declaration for function call
return 0
}
