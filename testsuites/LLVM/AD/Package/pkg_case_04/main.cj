// DEPENDENCE: pkg
// EXEC:%compiler %cmp_opt  %enableAD -c pkg/pkg_A.cj -o pkg_A.%middle
// EXEC:%compiler %cmp_opt  %enableAD -c pkg/pkg_B.cj -o pkg_B.%middle
// EXEC:%compiler %cmp_opt %enableAD %n.cj pkg_A.%middle pkg_B.%middle -o %n.out 2>&1 | compare %f
// ASSERT: scan multiple imported adjoint for function square are found
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkg_A.*
import pkg_B.*

func testStage1()
{
    var x: Float64 = 2.0
    var dx1 = grad(square, x) 
    print("dx1 = ${dx1}")
}

func main(): Int64 {
    testStage1()
    0
}
