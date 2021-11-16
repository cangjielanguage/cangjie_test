// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{}

func g<T>(a:T):Int32{
a = 1 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
return 0
}

func main():Int64{
return g<A>(A())
}
