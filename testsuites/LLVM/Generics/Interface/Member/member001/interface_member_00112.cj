// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T>{
func t(a:X):X // EXPECTED: regex undeclared type name 'X'
}

func main(){return 0}
