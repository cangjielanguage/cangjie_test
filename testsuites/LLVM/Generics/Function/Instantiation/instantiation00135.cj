// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{}
class B <: A{}
func test<A>(a:A){}

func main(){
    var a : A = B()
    test<A>(B())
    test<A>(a)
    return 0
}
