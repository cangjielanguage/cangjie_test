// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{}

trait update{
func foo(a:This):Int64
}

append A with update{
func foo(a:A):Int64{return 1}
}

interface Father<T>{}

interface I<T> <: Father<T> where T<:update {
static func test(a:T):Int64{
return foo(a)
}
}

func main(){
var i : Father<A>
return 1
}
