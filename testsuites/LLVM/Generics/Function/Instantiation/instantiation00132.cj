// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{a(Int32)}

func test<A>(a:A){}

func main(){
    var a : A = A.a(1)
    test<A>(A.a(1))
    test<A>(a)
    return 0
}
