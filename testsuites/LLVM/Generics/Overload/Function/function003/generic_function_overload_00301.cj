// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped

func test<T>(a:T){print("a")} // EXPECTED: regex function 'test' has overload conflicts
func test<T>(a:T){print("b")} // EXPECTED: regex function 'test' has overload conflicts


func main():Int64{
    test<Int64>(1) // EXPECTED: regex ambiguous match for function call
    return 1
}