// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// Deprecated trait!
trait TR{func test(a:This):Unit}
append Int64 with TR{func test(input:Int64){print("trait")}}

func test<T>(a:Int64){print("generic")}


func main():Int64{
    test(1)
    return 0
}