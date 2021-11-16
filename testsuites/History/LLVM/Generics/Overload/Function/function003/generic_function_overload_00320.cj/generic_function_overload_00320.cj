// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan append_a

trait TR{func test(a:This,b:Int64):Unit}
record A<T>{}
append<T> A<T> with TR{
  func test(a:A<T>,b:Int64):Unit{print("append_a")}
}
append A<Int64> with TR{
  func test(a:A<Int64>,b:Int64):Unit{print("append_b")}
}


func main():Int64{
    A<Int32>().test(1)
    return 0
}