// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : List<Int32> = [1]
    test<List<Int32>>(a)
    return 0
}
