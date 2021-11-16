// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan append

trait TR{func test(a:This):Unit}
record A<T>{}
append<T> A<T> with TR{
  func test(a:A<T>):Unit{print("append")}
}
func test<T>(a:T):Unit{print("top-level")}


func main():Int64{
    test(A<Int64>())
    return 0
}