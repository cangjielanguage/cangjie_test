// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface A<X>{}
class B<X> <: A<X>{}

open class C{}
class D <: C{}

func main(){
var i : A<C> = B<D>() // EXPECTED: regex no matching constructor for call 'B'
return 0
}
