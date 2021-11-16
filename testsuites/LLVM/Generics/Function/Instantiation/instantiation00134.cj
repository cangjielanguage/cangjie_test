// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}

func test<A>(a:A){}

func main(){
    var a : A = A()
    test<A>(A())
    test<A>(a)
    return 0
}
