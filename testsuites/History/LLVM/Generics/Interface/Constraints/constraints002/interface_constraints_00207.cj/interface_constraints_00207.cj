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

interface I<T> where T<:update {
func test(a:T):Int64{
return foo(a)
}
}

interface J<T> <: I<T>{}
class Child<T> <: I<T>{}

func main(){
var a : J<A>
var b : Child<A> = Child<A>()
if (b.test(A()) != 1) {
return 1
}
return 0
}
