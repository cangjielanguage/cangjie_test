// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan func_a
func test<T>(a:T){print("func_a")}
func test<T>(a:T,b:T){print("func_b")}


func main():Int64{
    test<Int64>(1)
    return 0
}