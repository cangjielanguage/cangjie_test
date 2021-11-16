// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update
{
func assert(a:This):Int32
}

class A{}

append A with update
{
func assert(a:A):Int32{return 0}
}

func g<T>(a:T)
{
return assert(a) // EXPECTED: regex no matching function declaration for function call
}

func main()
{
return g<A>(A())
}
