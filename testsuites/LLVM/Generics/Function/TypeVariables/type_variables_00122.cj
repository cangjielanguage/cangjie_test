// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func g<T>(a:T):T // EXPECTED: regex function declaration must have function body
func f<T>() // EXPECTED: regex function declaration must have function body
func main(){return 0}
