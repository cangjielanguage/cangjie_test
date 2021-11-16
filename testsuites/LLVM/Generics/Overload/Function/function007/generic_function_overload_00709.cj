// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped
// ASSERT: scan-not stack trace
open class Base{}
class Sub <: Base{}

func f(a: (Base)->Int64, b : Sub){return a(Base())+1} //f1
func f(a: (Sub)->Int64, b: Base){return a(Sub())+2} //f2
func g(a: Base): Int64{return 1} //g1
func g(a: Sub): Int64{return 2} //g2


func main():Int64{
    var i = f(g, Base()) // EXPECTED: regex ambiguous match for reference 'g'
    if (i != 4) {
        return 1
    }
    return 0
}
