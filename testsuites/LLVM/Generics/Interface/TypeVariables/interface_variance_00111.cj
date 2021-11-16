// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I <var>{} // EXPECTED: regex-auto 'var' is keyword not identifier, you can use '`var`' instead

func main(){return 0}
