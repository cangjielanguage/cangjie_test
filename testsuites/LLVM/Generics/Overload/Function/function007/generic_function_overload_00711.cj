// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class Base{}
class Sub <: Base{}

func f(a: (Base)->Int64, b : Sub){return a(Base())+1} //f1
func f(a: (Sub,Sub)->Int64, b: Base){return a(Sub(), Sub())+2} //f2
func g(a: Base): Int64{return 1} //g1
func g(a: Base, b: Sub): Int64{return 2} //g2
func g(a: Sub, b: Base): Int64{return 2} //g3


func main():Int64{
var i = f(g, Base()) // EXPECTED: regex error.*ambiguous match for reference 'g'
    return 0
}
