// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped

func test(){print("normal")} // EXPECTED: regex function 'test' has overload conflicts
func test<T>(){print("generic")} // EXPECTED: regex function 'test' has overload conflicts


func main():Int64{
    return 1
}