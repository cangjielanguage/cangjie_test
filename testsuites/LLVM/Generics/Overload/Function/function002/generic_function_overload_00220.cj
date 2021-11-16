// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{}
class B <: A{}
func test(a:A){print("normal")}
func test<T>(a:T)where T<:A{print("generic")}

func main():Int64{
    test(B()) // EXPECTED: regex ambiguous match for function call
    return 0
}
