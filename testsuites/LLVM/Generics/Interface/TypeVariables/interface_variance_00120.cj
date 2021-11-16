// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<A><B>{}// EXPECTED: regex expected '{' in interface

func main(){return 0}
