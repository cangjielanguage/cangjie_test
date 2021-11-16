// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped

func test(a:Int64){print("normal")} // EXPECTED: regex function 'test' has overload conflicts
func test<T>(a:Int64){print("generic")} // EXPECTED: regex function 'test' has overload conflicts


func main():Int64{
    return 1
}