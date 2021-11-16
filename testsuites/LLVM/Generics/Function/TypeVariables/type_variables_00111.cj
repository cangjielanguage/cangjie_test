// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func g<var>(a:var){} // EXPECTED: regex-auto 'var' is keyword not identifier, you can use '`var`' instead

func main(){return 0}
