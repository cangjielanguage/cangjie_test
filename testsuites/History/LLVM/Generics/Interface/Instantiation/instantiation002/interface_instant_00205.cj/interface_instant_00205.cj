// ERRCHECK: %compiler %cmp_opt -c %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
trait update{
func foo(a:This):Int32
}

class A{}

append A with update{
func foo(a:A):Int32{1}
}

class B{}

class D<T> where T <: update{}
record E<T> where T <: update{}

var G = D<B>() // EXPECTED: regex generics type arguments do not match the constraint
var H = E<B>() // EXPECTED: regex generics type arguments do not match the constraint

