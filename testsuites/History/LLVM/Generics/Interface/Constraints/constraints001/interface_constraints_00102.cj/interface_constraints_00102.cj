// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update{}
interface I where T<:update {}// EXPECTED: regex-auto there should not be 'where' because there are no type parameters
func main(){return 0}
