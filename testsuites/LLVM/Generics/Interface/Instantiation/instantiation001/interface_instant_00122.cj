// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X>{}

interface B <: A<X> & A<Y>{} // EXPECTED: regex undeclared type name 'X'

func main(){
var i : A<Int32>
var j : B
return 0
}
