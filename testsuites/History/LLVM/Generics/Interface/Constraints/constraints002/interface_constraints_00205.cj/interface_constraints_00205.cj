// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}

trait father{}

trait update where This <: father{
func foo(a:This):Int64
}


interface I<T> where T<:update {
static func test(a:T):Int64{
return a.foo()
}
}


func main(){
if (I<A>.test(A()) == 1) { // EXPECTED: regex function 'test' cannot be accessed by interface name 'I'
return 0
}
return 1
}
