// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}
class Child <: Father{}

func f1(a:Child):Father{return Father()}
func f2(a:Father):Child{return Child()} // f2 type is f1 type`s child type.

func assert<T>(input:T):Int32{
return 0
}

func main():Int64{
assert<(Father)->Child>(f1) // EXPECTED: regex no matching function declaration for function call
return 0
}
