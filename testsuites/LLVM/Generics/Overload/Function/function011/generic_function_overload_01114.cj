// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A<T>{}
class B<T> {}
func foo<X>(a: A<X>, b: B<X>):Int64 {1} // foo1
func foo<X>(a: A<X>, b: B<Int32>):Int64 {2} // foo2

func main() {
foo(A<Int32>(),B<Int32>()) // EXPECTED: regex ambiguous match for function call
}
