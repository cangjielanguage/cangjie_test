// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{}
open class C <: A{}
open class E <: C{}

open class B{}
open class D <: B{}
open class F <: D{}



enum X{a(A*D)}
enum Y{a(C*B)}

func main():Int64{
var j = a((E(),F())) // EXPECTED: regex find multiple constructor 'a' of enum declaration
return 1
}
