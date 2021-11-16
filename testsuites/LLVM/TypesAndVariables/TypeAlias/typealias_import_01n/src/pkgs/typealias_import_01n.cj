// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package pkgs

type Int = Int64
type Int = Int32 // EXPECTED: regex redefinition of declaration 'Int'

