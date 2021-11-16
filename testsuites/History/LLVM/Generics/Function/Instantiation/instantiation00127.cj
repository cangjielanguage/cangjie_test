// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : Map<Int32,Int32> = #{1:1}
    test<Map<Int32,Int32>>(a)
    return 0
}
