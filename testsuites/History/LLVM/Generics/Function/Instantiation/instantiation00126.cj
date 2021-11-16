// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(){
    var a : Set<Int32> = #{1}
    test<Set<Int32>>(a)
    return 0
}
