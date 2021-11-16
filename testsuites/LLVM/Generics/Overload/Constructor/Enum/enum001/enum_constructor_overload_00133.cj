// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{}
open class C <: A{}
open class E <: C{}

open class B{}
open class D <: B{}
open class F <: D{}



enum X{a(A*B)}
enum Y{a(C*D)}

func main():Int64{
    var j = a((E(),F())) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : Y => 0
        case _ => 1
    }
    return res_j
}