// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
interface I<T> where T< update {}// EXPECTED: regex-auto expected '<:'
func main(){return 0}
