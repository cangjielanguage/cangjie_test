// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
class A<T>{
    func test(a:T){print("A_first")} // EXPECTED: regex function 'test' has overload conflicts
    func test(a:T){print("A_second")} // EXPECTED: regex function 'test' has overload conflicts
}

func main():Int64{
    return 0
}