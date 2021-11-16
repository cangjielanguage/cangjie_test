// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class A<T>{
func test(a:T){} // EXPECTED: regex overridden function 'test' should have 'open' modifier
}

class B<T> <: A<T> {
func test(a:T){} // EXPECTED: regex need 'override' modifier for function 'test'
}

func main():Int64{
return 1
}
