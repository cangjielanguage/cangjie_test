// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan append
func test<T>(a:T){print("func_a")}

trait TR{func test(a:This):Unit}
append Int64 with TR{func test(a:Int64):Unit{print("append")}}

func main():Int64{
    test<Int64>(1)
    return 0
}