// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I <T,T>{} // EXPECTED: regex redefinition of declaration 'T'

func main(){return 0}
