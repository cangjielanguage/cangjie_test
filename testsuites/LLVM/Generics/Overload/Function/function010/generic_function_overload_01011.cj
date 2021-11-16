// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{}
open class B <: A{}
open class C <: B{}
open class D <: C{}
open class E <: D{}

func f<X>(a:X){0} // EXPECTED: regex function 'f' has overload conflicts
func f<Y>(a:Y){1} // EXPECTED: regex function 'f' has overload conflicts

func main() {
f(E()) // EXPECTED: regex ambiguous match for function call
}
