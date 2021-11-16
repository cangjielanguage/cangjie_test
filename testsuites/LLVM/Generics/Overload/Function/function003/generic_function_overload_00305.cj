// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test<T>(a:T,b:T){print("func_a")} // EXPECTED: regex function 'test' has overload conflicts
func test<T>(a:T,b:T){print("func_b")} // EXPECTED: regex function 'test' has overload conflicts


func main():Int64{
test<Int64>(1,1) // EXPECTED: regex ambiguous match for function call
return 0
}
