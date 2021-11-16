// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{}
open class D <: A{}
open class G <: D{}

open class B{}
open class E <: B{}
open class H <: E{}

open class C{}
open class F <: C{}
open class I <: F{}



enum X{a(A*B*F)}
enum Y{a(D*E*C)}

func main():Int64{
var j = a((G(),H(),I())) // EXPECTED: regex find multiple constructor 'a' of enum declaration
return 1
}
