// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{}

interface I<T> where T<:A {
}

func main(){
var i : I<A>
return 0
}
