// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait first{}
trait second where This <: first{}
class A{}
append A with first{}

func g<T>() where T<:second {}

func main(){
g<A>() // EXPECTED: regex no matching function declaration for function call
return 0
}
