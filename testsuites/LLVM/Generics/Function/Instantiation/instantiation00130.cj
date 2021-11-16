// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : ()->Unit = {  => }
    func b(){}
    test<()->Unit>(a)
    test<()->Unit>(b)
    return 0
}
