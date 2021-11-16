// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj  -o pkg1.%middle
// EXEC: %compiler %cmp_opt -c    %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package pkg2

import pkg1


func run(): Int64 {
    var data : pkg1.Base = pkg1.Base() // EXPECTED: regex undeclared type name 'Base'
    return 0
}
