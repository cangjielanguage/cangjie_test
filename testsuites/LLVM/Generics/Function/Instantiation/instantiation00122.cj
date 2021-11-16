// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(){}

func main(){
    test<Int32>()
    return 0
}