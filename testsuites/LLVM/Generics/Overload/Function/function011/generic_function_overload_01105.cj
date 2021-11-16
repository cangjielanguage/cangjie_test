// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{}
open class B <: A{}

func foo<X>(a: X, b: X): Int64 {1} // foo1
func foo<X>(a: A, b: X) :Int64 {0} // foo2


func main() {
foo(A(),B())  // EXPECTED: regex-auto ambiguous match for function call 'foo'
}

// foo1(x) { foo2(x) }
// X1 <: A    ,    X1 <: X2
// false

// foo2(x){ foo1(x) }
// A <: X1     ,   X2 <: X1
// {A, X2} <: X1
// X1 = join(A, X2) = Any
// ?
