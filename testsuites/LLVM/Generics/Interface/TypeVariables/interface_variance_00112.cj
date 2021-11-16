// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I <1>{} // EXPECTED: regex expected identifier here

func main(){return 0}
