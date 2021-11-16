// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class A<T>{}
open class B<T> <: A<T>{}
open class C<T> <: B<T>{}

func foo<X>(a: A<X>, b: B<X>): Int64 {1} // foo1
func foo<X>(a: B<X>, b: A<X>) :Int64 {0} // foo2


func main() {
foo<Int64>(C<Int64>(),C<Int64>()) // EXPECTED: regex ambiguous match for function call
}
