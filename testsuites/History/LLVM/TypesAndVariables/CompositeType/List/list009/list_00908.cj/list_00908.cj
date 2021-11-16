// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait A{
func test(input:This):This
}

class C<T>{}

append<T> C<T> with A where T<:List<Int64>{
func test(input:C<T>):C<T>{
return input
}
}

func main(): Int64 {
test(C<List<Int32>>()) // EXPECTED: regex no matching function declaration for function call
return 0
}
