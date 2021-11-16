// DEPENDENCE: ../testcase
// EXEC: %compiler %cmp_opt -c  testcase/b/b1.cj -o b1.%middle
// EXEC: %compiler %cmp_opt -c  testcase/b/b2.cj -o b2.%middle
// EXEC: %compiler %cmp_opt -c  %f b1.%middle b2.%middle  -o ./out.%middle 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'b1'

package testcase
import testcase.b.*

var c1 = b1
var c2 = b2
