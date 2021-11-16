// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{}

trait update{
}

trait child where This <: update{
func foo(a:This):Int64
}

append A with child,update{
func foo(a:A):Int64{return 1}
}

interface I<T> where T<:update {
static func test(a:T):Int64{
return a.foo() // EXPECTED: regex no matching function declaration for function call
}
}


func main(){
if (I<A>.test(A()) == 1) {
return 0
}
return 1
}
