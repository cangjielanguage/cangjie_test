// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(i:T){
    var a : (?T)->?T = {x=>x}
}
func main(): Int64 {
    test(0)
    return 0
}
