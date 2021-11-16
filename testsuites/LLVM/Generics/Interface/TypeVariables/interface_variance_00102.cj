// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T{} // EXPECTED: regex-auto expected '>' in the end of collection or tuple type or type parameters

func main(){return 0}
