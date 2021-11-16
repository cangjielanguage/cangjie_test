// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A<X>{}

open class C{}
class D <: C{}

func main(){
var i : A<C> = A<D>() // EXPECTED: regex no matching constructor for call 'A'
return 0
}
