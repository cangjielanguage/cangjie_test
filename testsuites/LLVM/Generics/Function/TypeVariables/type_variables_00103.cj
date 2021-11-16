// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g T>(a:T){} // EXPECTED: regex expected function parameters after function name

func main(){return 0}
