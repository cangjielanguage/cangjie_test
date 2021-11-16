// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<T,T>(a:T){} // EXPECTED: regex redefinition of declaration 'T'

func main(){return 0}
