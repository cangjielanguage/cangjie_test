// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I T>{} // EXPECTED: regex-auto unexpected symbol here, expected '<:' to inherit or '{' to open a scope
interface IT>{} // EXPECTED: regex-auto expected '{' in interface

func main(){return 0}
