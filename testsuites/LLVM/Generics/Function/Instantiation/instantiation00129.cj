// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : Range<Int64> = 0..10
    test<Range<Int64>>(a)
    return 0
}
