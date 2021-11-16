// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<A>(a:A){}

func main(): Int64{
    var a : Option<Int32> = Some<Int32>(100)
    test<Option<Int32>>(Some<Int32>(100))
    test<Option<Int32>>(a)
    return 0
}
