// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped
func test<X,Y>(a:X,b:Y){print("func_a")}
func test<X,Y>(a:Y,b:X){print("func_b")}


func main():Int64{
    test<Int64,Int64>(1,1) // EXPECTED: regex ambiguous match for function call
    return 0
}