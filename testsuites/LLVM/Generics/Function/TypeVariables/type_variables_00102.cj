// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<T(a:T){} // EXPECTED: regex expected '>' in the end of collection or tuple type or type parameters

func main(){return 0}
