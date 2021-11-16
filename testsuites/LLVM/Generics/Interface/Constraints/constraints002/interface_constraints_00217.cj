// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<T>{}

interface I<T> where T<:A<T> {}

func main(){
var i : I<A>
return 0
}
