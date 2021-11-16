// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
open class A{}
open class D <: A{}
open class G <: D{}

open class B{}
open class E <: B{}
open class H <: E{}

open class C{}
open class F <: C{}
open class I <: F{}



enum X{a(A*H*I)}
enum Y{a(G*B*I)}
enum Z{a(G*H*C)}

func main():Int64{
    var j = a((G(),H(),I())) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    return 1
}
