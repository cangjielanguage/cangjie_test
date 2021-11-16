// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}

interface B{}


class Z<X,Y> where X <: A, Y <: B{}

func main():Int64{
Z<B,A>() // EXPECTED: regex generics type arguments do not match the constraint
return 0
}
