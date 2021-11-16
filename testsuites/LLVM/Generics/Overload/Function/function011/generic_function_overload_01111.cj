// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class A<T>{}
open class B<T> <: A<T>{}
open class C<T> <: A<T>{}

func foo<X,Y>(a: B<X>, b: C<Y>): Int64 {1} // foo1
func foo<X,Y>(a: B<Y>, b: C<X>) :Int64 {0} // foo2


func main() {
foo(B<Int64>(),C<Int64>()) // EXPECTED: regex ambiguous match for function call
}
