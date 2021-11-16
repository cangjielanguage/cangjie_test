// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}
class Child <: Father{}

func f1(a:Child):Child{return Child()}
func f2(a:Father):Father{return Father()}

func assert<T>(input:T):Int32{
return 0
}

func main():Int64{
assert<(Father)->Father>(f1) // EXPECTED: regex no matching function declaration for function call
assert<(Child)->Child>(f2) // EXPECTED: regex no matching function declaration for function call
return 0
}
