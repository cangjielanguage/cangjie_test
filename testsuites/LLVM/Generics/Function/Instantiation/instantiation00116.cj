// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : Float32 = 0.0
    test<Float32>(a)
    return 0
}
