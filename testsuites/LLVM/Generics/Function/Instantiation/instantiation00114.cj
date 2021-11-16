// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : UInt64 = 0
    test<UInt64>(a)
    return 0
}
