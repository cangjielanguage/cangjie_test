// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I <Int32>{} // EXPECTED: regex-auto 'Int32' is keyword not identifier, you can use '`Int32`' instead

func main(){return 0}
