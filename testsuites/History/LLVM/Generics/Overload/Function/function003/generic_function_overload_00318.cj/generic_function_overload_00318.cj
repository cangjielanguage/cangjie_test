// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait TR{func test(a:This):Unit} // EXPECTED: regex-auto trait 'TR' to type 'Record-A' append resolution ambiguous
record A<T>{}
append<T> A<T> with TR{
func test(a:A<T>):Unit{print("append_a")}
}
append A<Int64> with TR{
func test(a:A<Int64>):Unit{print("append_b")}
}
func test<T>(a:T):Unit{print("top-level")}


func main():Int64{
test(A<Int64>())
return 0
}
