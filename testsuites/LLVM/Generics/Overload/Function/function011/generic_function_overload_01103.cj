// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{}
open class B <: A{}
open class C <: B{}

open class D{}
open class E <: D{}
open class F <: E{}

open class G{}
open class H <: G{}
open class I <: H{}

func f<X,Y,Z>(a:X*Y*Z) where X<:A,Y<:D,Z<:I{0} //F1
func f<X,Y,Z>(a:X*Y*Z) where X<:A,Y<:F,Z<:G{1} //F2
func f<X,Y,Z>(a:X*Y*Z) where X<:C,Y<:D,Z<:G{1} //F3


func main() {
f((C(),F(),I())) // EXPECTED: regex ambiguous match for function call
}
