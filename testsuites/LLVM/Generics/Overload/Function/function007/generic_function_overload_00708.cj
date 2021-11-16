// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{}
class Sub <: Base{}

func f(a: (Base)->Int64, b : Base){
	a(b)
} //f1
func f(a: (Sub)->Int64, b: Sub){
	a(b)
} //f2
func g(a: Base): Int64{
	1
} //g1
func g(a: Sub): Int64{
	2
} //g2


func main():Int64{
    if( f(g, Base()) == 1){
    	return 0
    }
    return 1
}
