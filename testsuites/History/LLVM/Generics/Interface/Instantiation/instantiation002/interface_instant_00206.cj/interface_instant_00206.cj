// ERRCHECK: %compiler %cmp_opt -c %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
trait update{
func foo(a:This):Int32
}

class A{}

append A with update{
func foo(a:A):Int32{1}
}

interface C<T> where T <: update{}

class D <: C<Int32>{} // EXPECTED: regex generics type arguments do not match the constraint

