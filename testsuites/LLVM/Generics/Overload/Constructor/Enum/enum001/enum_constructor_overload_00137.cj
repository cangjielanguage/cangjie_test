// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
open class A{}
open class D <: A{}
open class G <: D{}

open class B{}
open class E <: B{}
open class H <: E{}

open class C{}
open class F <: C{}
open class I <: F{}



enum X{a(A*B*C)}
enum Y{a(A*B*F)}
enum Z{a(D*E*F)}

func main():Int64{
    var j = a((G(),H(),I())) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : Z => 0
        case _ => 1
    }
    return res_j
}