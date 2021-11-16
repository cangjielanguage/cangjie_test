// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class Base{}
class Sub <: Base{}

func test<T>(a:T,b:Sub){} // f1
func test<T>(a:T,b:Base){} // f2
func g(a: Base): Int64{1} // g1
func g(a: Sub): Int64{2} // g2


func main():Int64{
var i = test(g, Base()) // EXPECTED: regex error.*no matching function declaration for function call 'test'
return 0
}
